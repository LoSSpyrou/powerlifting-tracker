import 'package:flutter/material.dart';

import '../../../../../domain/models/format_weight.dart';
import '../../../../../domain/use_cases/calculators/one_rep_max_table.dart';
import '../../../../../domain/use_cases/calculators/plate_math.dart';
import '../../../../core/app_preview.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/rpe_selector.dart';

class OneRepMaxTab extends StatefulWidget {
  @AppPreview(name: '1RM Calculator')
  const OneRepMaxTab({super.key});

  @override
  State<OneRepMaxTab> createState() => _OneRepMaxTabState();
}

class _OneRepMaxTabState extends State<OneRepMaxTab>
    with AutomaticKeepAliveClientMixin {
  final _weightController = TextEditingController(text: '100');
  final _repsController = TextEditingController(text: '5');
  double? _rpe = 8.0;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final weight = double.tryParse(_weightController.text);
    final reps = int.tryParse(_repsController.text);
    final rpe = _rpe;
    final estimate = (weight != null && reps != null && rpe != null)
        ? estimateOneRepMax(weight: weight, reps: reps, rpe: rpe)
        : null;
    final numericStyle = AppTypography.numeric(
      fontSize: 22,
      color: theme.colorScheme.onSurface,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _weightController,
                  style: numericStyle,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _repsController,
                  style: numericStyle,
                  decoration: const InputDecoration(labelText: 'Reps'),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RpeSelector(
            value: _rpe,
            onChanged: (v) => setState(() => _rpe = v),
            minRpe: kMinChartRpe,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('ESTIMATED 1RM', style: theme.textTheme.labelLarge),
                  const SizedBox(height: 8),
                  if (estimate != null)
                    Column(
                      children: [
                        Text(
                          '${formatWeight(roundToLoadable(estimate))}kg',
                          style: AppTypography.numeric(
                            fontSize: 36,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rounded to the nearest loadable '
                          '${formatWeight(kSmallestLoadableIncrementKg)}kg',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Enter a weight, reps (1-12), and RPE',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
