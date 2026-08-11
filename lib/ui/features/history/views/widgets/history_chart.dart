import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../data/services/database.dart';
import '../../../../../domain/models/format_weight.dart';
import '../../../../../domain/models/lift_type.dart';
import '../../../../../domain/models/logged_set.dart';
import '../../../../core/app_preview.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Plots weight per session for one lift, with each point colored by the
/// RPE it was logged at -- the same plate-color ramp used everywhere else
/// in the app. A rising line with reddening dots reads as "heavier, but at
/// rising cost" at a glance, the way a lifter actually reads their log.
class HistoryChart extends StatelessWidget {
  const HistoryChart({
    super.key,
    required this.sets,
    this.highlightedIndex,
    this.onHover,
  });

  final List<LoggedSet> sets;

  /// Index into [sets] (ascending order, same as the plotted spots) to draw
  /// as emphasized -- driven by hovering the matching row in the set list
  /// below the chart, or by hovering the chart itself.
  final int? highlightedIndex;

  /// Reports the index of the spot under the pointer as the chart itself is
  /// hovered/touched (null when nothing is under the pointer), so the
  /// caller can drive [highlightedIndex] from either the chart or the list.
  final ValueChanged<int?>? onHover;

  static const _dayMs = Duration(days: 1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    final spots = [
      for (final s in sets)
        FlSpot(
          s.entry.createdAt.millisecondsSinceEpoch.toDouble(),
          s.entry.weight,
        ),
    ];

    final xs = spots.map((s) => s.x);
    final ys = spots.map((s) => s.y);
    final minX = xs.reduce((a, b) => a < b ? a : b);
    final maxX = xs.reduce((a, b) => a > b ? a : b);
    final minY = ys.reduce((a, b) => a < b ? a : b);
    final maxY = ys.reduce((a, b) => a > b ? a : b);
    final dayMs = _dayMs.inMilliseconds.toDouble();

    // Ticks are spaced at a quarter of the real data range and padding is
    // exactly one tick-step, so the real min/max (an actual logged set) is
    // always one of the generated ticks rather than being cropped off by an
    // interval that was chosen independently of the data. Anchoring the grid
    // baseline to the real min (below) is what makes fl_chart's tick
    // generator start exactly there instead of snapping to a step measured
    // from zero.
    final xInterval = maxX > minX ? (maxX - minX) / 4 : dayMs;
    final yInterval = maxY > minY ? (maxY - minY) / 4 : 20.0;
    final xPad = xInterval;
    final yPad = yInterval;

    final disableAnimations = MediaQuery.of(context).disableAnimations;

    Color dotColorFor(int index) {
      final rpe = sets[index].entry.rpe;
      return rpe != null ? AppColors.rpeColor(rpe) : theme.colorScheme.primary;
    }

    final lineBarData = LineChartBarData(
      spots: spots,
      isCurved: false,
      barWidth: 2,
      color: onSurface.withValues(alpha: 0.35),
      belowBarData: BarAreaData(show: false),
      showingIndicators: highlightedIndex != null ? [highlightedIndex!] : [],
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
          radius: 5,
          color: dotColorFor(index),
          strokeWidth: 1.5,
          strokeColor: onSurface.withValues(alpha: 0.3),
        ),
      ),
    );

    // Same-day sets often share (or nearly share) both weight and date, so
    // their dots land on top of each other pixel-for-pixel. Highlighting in
    // place on the shared main bar would get redrawn over by whichever
    // coincident point happens to paint later. Drawing the highlight as its
    // own single-spot bar appended last guarantees it paints on top of every
    // other dot, regardless of how many sets collide at that position.
    final highlightBars = highlightedIndex != null
        ? [
            LineChartBarData(
              spots: [spots[highlightedIndex!]],
              barWidth: 0,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) =>
                    FlDotCirclePainter(
                      radius: 8,
                      color: dotColorFor(highlightedIndex!),
                      strokeWidth: 2.5,
                      strokeColor: onSurface.withValues(alpha: 0.9),
                    ),
              ),
            ),
          ]
        : null;

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          baselineX: minX,
          baselineY: minY,
          minX: minX - xPad,
          maxX: maxX + xPad,
          minY: (minY - yPad).clamp(0, double.infinity),
          maxY: maxY + yPad,
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: yInterval,
            getDrawingHorizontalLine: (_) => FlLine(
              color: onSurface.withValues(alpha: 0.08),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                interval: yInterval,
                minIncluded: false,
                maxIncluded: false,
                getTitlesWidget: (value, meta) => Text(
                  formatWeight(value),
                  style: AppTypography.numeric(
                    fontSize: 11,
                    color: onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 26,
                interval: xInterval,
                minIncluded: false,
                maxIncluded: false,
                getTitlesWidget: (value, meta) {
                  final date = DateTime.fromMillisecondsSinceEpoch(
                    value.toInt(),
                  );
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      '${date.month}/${date.day}',
                      style: AppTypography.numeric(
                        fontSize: 10,
                        color: onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          lineBarsData: [lineBarData, ...?highlightBars],
          showingTooltipIndicators: highlightedIndex != null
              ? [
                  ShowingTooltipIndicators([
                    LineBarSpot(lineBarData, 0, spots[highlightedIndex!]),
                  ]),
                ]
              : [],
          lineTouchData: LineTouchData(
            // fl_chart's built-in touch handling owns showingTooltipIndicators
            // and overwrites anything set here when enabled, which is what
            // silently ate the manually-driven tooltip below. Handling touch
            // ourselves keeps the chart's own hover and the set list's hover
            // driving the same highlightedIndex/showingTooltipIndicators.
            handleBuiltInTouches: false,
            touchCallback: (event, response) {
              // Only trust spots from the real data bar (barIndex 0) -- the
              // highlight overlay bar (appended when highlightedIndex is
              // set) shares its coordinate but always reports spotIndex 0
              // for itself, which would misidentify which point is touched.
              final dataSpots = (response?.lineBarSpots ?? []).where(
                (s) => s.barIndex == 0,
              );
              if (!event.isInterestedForInteractions || dataSpots.isEmpty) {
                onHover?.call(null);
                return;
              }
              onHover?.call(dataSpots.first.spotIndex);
            },
            touchTooltipData: LineTouchTooltipData(
              fitInsideVertically: true,
              fitInsideHorizontally: true,
              getTooltipColor: (_) =>
                  theme.cardTheme.color ?? theme.colorScheme.surface,
              getTooltipItems: (touchedSpots) => [
                for (final spot in touchedSpots)
                  LineTooltipItem(
                    '${formatWeight(spot.y)} ${sets[spot.spotIndex].entry.unit.name}',
                    AppTypography.numeric(fontSize: 12, color: onSurface),
                  ),
              ],
            ),
          ),
        ),
        duration: disableAnimations
            ? Duration.zero
            : const Duration(milliseconds: 150),
      ),
    );
  }
}

@AppPreview(name: 'History Chart')
Widget historyChartPreview() {
  const lift = Lift(id: 1, type: LiftType.squat);
  final now = DateTime.now();
  return HistoryChart(
    sets: [
      for (var i = 0; i < 6; i++)
        LoggedSet(
          lift: lift,
          entry: SetEntry(
            id: i,
            sessionId: i,
            liftId: 1,
            weight: 120 + i * 5,
            reps: 5,
            rpe: 6.5 + i * 0.5,
            unit: WeightUnit.kg,
            createdAt: now.subtract(Duration(days: (6 - i) * 7)),
          ),
        ),
    ],
  );
}
