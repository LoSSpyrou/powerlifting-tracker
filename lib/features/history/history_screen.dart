import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/repositories/log_providers.dart';
import '../log/widgets/lift_selector.dart';
import 'widgets/history_chart.dart';
import 'widgets/history_set_row.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  int? _selectedLiftId;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final liftsAsync = ref.watch(liftsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: liftsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error loading lifts: $error')),
        data: (lifts) {
          if (lifts.isEmpty) {
            return const Center(child: Text('No lifts available'));
          }
          _selectedLiftId ??= lifts.first.id;
          final liftId = _selectedLiftId!;
          final setsAsync = ref.watch(setsForLiftProvider(liftId));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: LiftSelector(
                  lifts: lifts,
                  selectedLiftId: liftId,
                  onSelected: (id) => setState(() => _selectedLiftId = id),
                ),
              ),
              Expanded(
                child: setsAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text('Error: $error')),
                  data: (sets) {
                    if (sets.isEmpty) {
                      return const Center(
                        child: Text('No sets logged for this lift yet'),
                      );
                    }
                    final reversed = sets.reversed.toList();
                    return ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: HistoryChart(
                            sets: sets,
                            highlightedIndex: _hoveredIndex,
                            onHover: (index) =>
                                setState(() => _hoveredIndex = index),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Text(
                            'ALL SETS',
                            style: theme.textTheme.labelLarge?.copyWith(
                              letterSpacing: 1,
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ),
                        for (final entry in reversed.asMap().entries)
                          MouseRegion(
                            onEnter: (_) => setState(
                              () => _hoveredIndex = sets.length - 1 - entry.key,
                            ),
                            onExit: (_) => setState(() => _hoveredIndex = null),
                            child: HistorySetRow(loggedSet: entry.value),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
