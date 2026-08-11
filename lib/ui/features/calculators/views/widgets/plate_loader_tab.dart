import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../domain/models/format_weight.dart';
import '../../../../../domain/use_cases/calculators/plate_math.dart';
import '../../../../core/theme/app_typography.dart';
import 'plate_bar_visual.dart';

/// Rejects an edit outright if it would parse to more than [max] -- keeps
/// the field itself from ever holding an unloadable-in-practice weight,
/// rather than accepting it and correcting after the fact.
class _MaxValueFormatter extends TextInputFormatter {
  const _MaxValueFormatter(this.max);

  final double max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final parsed = double.tryParse(newValue.text);
    if (parsed != null && parsed > max) return oldValue;
    return newValue;
  }
}

class PlateLoaderTab extends StatefulWidget {
  const PlateLoaderTab({super.key});

  @override
  State<PlateLoaderTab> createState() => _PlateLoaderTabState();
}

class _PlateLoaderTabState extends State<PlateLoaderTab>
    with AutomaticKeepAliveClientMixin {
  final _weightController = TextEditingController(text: '100');
  double _barWeight = kMensBarKg;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  /// Steps the target by the smallest loadable jump, snapping an
  /// off-increment typed value (e.g. 97) onto the loadable grid first so a
  /// single tap always lands on a weight you could actually put on the bar.
  void _step(int direction) {
    final current = double.tryParse(_weightController.text) ?? _barWeight;
    var next =
        roundToLoadable(current) + direction * kSmallestLoadableIncrementKg;
    if (next < _barWeight) next = _barWeight;
    if (next > kMaxPlateLoaderWeightKg) next = kMaxPlateLoaderWeightKg;
    setState(() => _weightController.text = formatWeight(next));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final target = double.tryParse(_weightController.text) ?? 0;
    final atMax = target >= kMaxPlateLoaderWeightKg;
    final breakdown = calculatePlates(
      targetWeight: target,
      barWeight: _barWeight,
    );
    final numericStyle = AppTypography.numeric(
      fontSize: 22,
      color: theme.colorScheme.onSurface,
    );

    Widget stepButton(IconData icon, VoidCallback onTap) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: onSurface.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: onSurface),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              stepButton(Icons.remove, () => _step(-1)),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _weightController,
                  style: numericStyle,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'Target weight (kg)',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    _MaxValueFormatter(kMaxPlateLoaderWeightKg),
                  ],
                  onChanged: (_) => setState(() {}),
                ),
              ),
              if (!atMax) ...[
                const SizedBox(width: 12),
                stepButton(Icons.add, () => _step(1)),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text('BAR', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: Text(
                  "MEN'S 20KG",
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
                selected: _barWeight == kMensBarKg,
                onSelected: (_) => setState(() => _barWeight = kMensBarKg),
              ),
              ChoiceChip(
                label: Text(
                  "WOMEN'S 15KG",
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
                selected: _barWeight == kWomensBarKg,
                onSelected: (_) => setState(() => _barWeight = kWomensBarKg),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: PlateBarVisual(perSidePlates: breakdown.perSide),
                  ),
                  const SizedBox(height: 16),
                  if (breakdown.perSide.isEmpty)
                    Text(
                      'No plates needed',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    )
                  else
                    Text.rich(
                      TextSpan(
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        children: [
                          ..._breakdownSpans(breakdown.perSide, theme),
                          const TextSpan(text: ' kg per side'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      style: AppTypography.numeric(
                        fontSize: 20,
                        color: theme.colorScheme.onSurface,
                      ),
                      children: [
                        const TextSpan(text: 'Loaded: '),
                        TextSpan(
                          text: '${formatWeight(breakdown.achievedTotal)}kg',
                        ),
                      ],
                    ),
                  ),
                  if ((breakdown.achievedTotal - target).abs() > 0.01)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Closest loadable weight -- can't hit "
                        '${formatWeight(target)}kg exactly with standard '
                        'plates',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<InlineSpan> _breakdownSpans(List<double> perSide, ThemeData theme) {
    final counts = <double, int>{};
    for (final plate in perSide) {
      counts[plate] = (counts[plate] ?? 0) + 1;
    }
    final numericStyle = AppTypography.numeric(
      fontSize: 14,
      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
    );

    final spans = <InlineSpan>[];
    for (final entry in counts.entries) {
      if (spans.isNotEmpty) spans.add(const TextSpan(text: ' + '));
      spans.add(
        TextSpan(
          text: '${entry.value}×${formatWeight(entry.key)}',
          style: numericStyle,
        ),
      );
    }
    return spans;
  }
}
