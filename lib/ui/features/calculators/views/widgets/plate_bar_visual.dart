import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Draws a loaded barbell, front-on: sleeve, plates heaviest-innermost
/// (the way they're actually loaded against the collar), a stretch of
/// exposed knurled bar, then the mirrored plates and sleeve on the other
/// side. Plate colors follow the same IPF ramp used for RPE; plate height
/// follows real competition-plate diameters, so 25kg and 20kg plates are
/// drawn the same height -- on a real platform they *are* the same
/// diameter, distinguished only by color and thickness.
class PlateBarVisual extends StatelessWidget {
  const PlateBarVisual({super.key, required this.perSidePlates});

  final List<double> perSidePlates;

  // Keyed by kg*100 (rounded) -- `double` can't be a const map key, since
  // it overrides `==`.
  static const _heights = {
    2500: 100.0,
    2000: 100.0,
    1500: 89.0,
    1000: 72.0,
    500: 50.0,
    250: 43.0,
    125: 38.0,
  };

  static const _colors = {
    2500: AppColors.plateRed,
    2000: AppColors.plateBlue,
    1500: AppColors.plateYellow,
    1000: AppColors.plateGreen,
    500: AppColors.plateWhite,
  };

  static int _key(double kg) => (kg * 100).round();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final outward = perSidePlates.reversed.toList();

    Widget plate(double kg) {
      final isSmallPlate = kg < 5;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: isSmallPlate ? 10 : 16,
          height: _heights[_key(kg)] ?? 50,
          decoration: BoxDecoration(
            color: _colors[_key(kg)] ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: onSurface.withValues(alpha: 0.3)),
          ),
        ),
      );
    }

    Widget sleeve() => Container(
      width: 22,
      height: 24,
      decoration: BoxDecoration(
        color: onSurface.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(2),
      ),
    );

    Widget bar() => Container(
      width: 48,
      height: 8,
      color: onSurface.withValues(alpha: 0.35),
    );

    final row = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        sleeve(),
        for (final kg in outward) plate(kg),
        bar(),
        for (final kg in perSidePlates) plate(kg),
        sleeve(),
      ],
    );

    // A heavy total can need more plates than fit in the available width --
    // scroll horizontally instead of overflowing, but still center the bar
    // when it's narrow enough to fit without scrolling.
    return SizedBox(
      height: 108,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Center(child: row),
            ),
          );
        },
      ),
    );
  }
}
