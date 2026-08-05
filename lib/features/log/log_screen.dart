import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/repositories/log_providers.dart';
import '../../database/repositories/log_repository_provider.dart';
import '../../shared/models/format_weight.dart';
import '../../shared/models/lift_type.dart';
import '../../shared/theme/app_typography.dart';
import 'widgets/lift_selector.dart';
import 'widgets/rpe_selector.dart';
import 'widgets/set_entry_tile.dart';
import 'widgets/three_lights.dart';

class LogScreen extends ConsumerStatefulWidget {
  const LogScreen({super.key});

  @override
  ConsumerState<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends ConsumerState<LogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _repsController = TextEditingController();
  int? _selectedLiftId;
  double? _selectedRpe;
  bool _submitting = false;
  bool _defaultsApplied = false;
  int _lightsTrigger = 0;

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  Future<void> _applyLastSetDefaults(int liftId) async {
    final last =
        await ref.read(logRepositoryProvider).lastSetForLift(liftId);
    if (!mounted || last == null) return;
    setState(() {
      _weightController.text = formatWeight(last.weight);
      _repsController.text = last.reps.toString();
      _selectedRpe = last.rpe;
    });
  }

  void _onLiftSelected(int liftId) {
    setState(() {
      _selectedLiftId = liftId;
      _weightController.clear();
      _repsController.clear();
      _selectedRpe = null;
    });
    _applyLastSetDefaults(liftId);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final liftId = _selectedLiftId;
    if (liftId == null) return;

    final weight = double.parse(_weightController.text);
    final reps = int.parse(_repsController.text);

    setState(() => _submitting = true);
    try {
      await ref.read(logRepositoryProvider).logSet(
            liftId: liftId,
            weight: weight,
            reps: reps,
            rpe: _selectedRpe,
            unit: WeightUnit.kg,
          );
      if (mounted) setState(() => _lightsTrigger++);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final liftsAsync = ref.watch(liftsProvider);
    final todaysSetsAsync = ref.watch(todaysSetsProvider);
    final numericStyle = AppTypography.numeric(
      fontSize: 22,
      color: theme.colorScheme.onSurface,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Log')),
      body: liftsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Error loading lifts: $error')),
        data: (lifts) {
          if (lifts.isEmpty) {
            return const Center(child: Text('No lifts available'));
          }
          if (!_defaultsApplied) {
            _defaultsApplied = true;
            _selectedLiftId = lifts.first.id;
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _applyLastSetDefaults(lifts.first.id),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LiftSelector(
                        lifts: lifts,
                        selectedLiftId: _selectedLiftId,
                        onSelected: _onLiftSelected,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _weightController,
                              style: numericStyle,
                              decoration: const InputDecoration(
                                labelText: 'Weight (kg)',
                              ),
                              keyboardType: const TextInputType
                                  .numberWithOptions(decimal: true),
                              validator: (value) {
                                final parsed = double.tryParse(value ?? '');
                                if (parsed == null || parsed <= 0) {
                                  return 'Enter a weight';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _repsController,
                              style: numericStyle,
                              decoration:
                                  const InputDecoration(labelText: 'Reps'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                final parsed = int.tryParse(value ?? '');
                                if (parsed == null || parsed <= 0) {
                                  return 'Enter reps';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      RpeSelector(
                        value: _selectedRpe,
                        onChanged: (value) =>
                            setState(() => _selectedRpe = value),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: _submitting ? null : _submit,
                        child: _submitting
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Log Set'),
                      ),
                      const SizedBox(height: 8),
                      ThreeLights(trigger: _lightsTrigger),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: todaysSetsAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (error, _) => const SizedBox.shrink(),
                  data: (sets) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TODAY'S SETS",
                        style: theme.textTheme.labelLarge?.copyWith(
                          letterSpacing: 1,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      Text(
                        '${sets.length}',
                        style: AppTypography.numeric(
                          fontSize: 14,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: todaysSetsAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text('Error: $error')),
                  data: (sets) {
                    if (sets.isEmpty) {
                      return const Center(
                        child: Text('No sets logged today yet'),
                      );
                    }
                    return ListView.builder(
                      itemCount: sets.length,
                      itemBuilder: (context, index) =>
                          SetEntryTile(loggedSet: sets[index]),
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
