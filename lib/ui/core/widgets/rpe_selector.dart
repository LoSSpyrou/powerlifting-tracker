import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// RPE as an intensity strip colored by the same light-to-heavy plate ramp
/// used for competition plates — low effort reads as a light plate color,
/// max effort reads as red.
class RpeSelector extends StatelessWidget {
  const RpeSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.minRpe = 1.0,
  });

  final double? value;
  final ValueChanged<double?> onChanged;

  /// Lowest RPE offered -- callers whose downstream calculation only
  /// covers part of the scale (e.g. the 1RM chart, which starts at 6.0)
  /// can raise this so they never offer a value that just dead-ends.
  final double minRpe;

  List<double> get _values => [
    for (int i = 2; i <= 20; i++)
      if (i / 2 >= minRpe) i / 2,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('RPE', style: theme.textTheme.labelLarge),
            if (value != null)
              TextButton(
                onPressed: () => onChanged(null),
                child: const Text('Clear'),
              ),
          ],
        ),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _values.length,
            separatorBuilder: (_, _) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final rpe = _values[index];
              final selected = value == rpe;
              final color = AppColors.rpeColor(rpe);
              final textColor =
                  ThemeData.estimateBrightnessForColor(color) == Brightness.dark
                  ? Colors.white
                  : Colors.black;

              return GestureDetector(
                onTap: () => onChanged(rpe),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: selected
                          ? theme.colorScheme.onSurface
                          : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: color.withValues(alpha: 0.6),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    rpe.toStringAsFixed(1),
                    style: AppTypography.numeric(
                      fontSize: 13,
                      color: textColor,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
