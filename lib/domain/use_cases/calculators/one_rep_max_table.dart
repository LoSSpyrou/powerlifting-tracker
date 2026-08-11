/// Percent of 1RM achievable at a given rep count and RPE, per the RTS RPE
/// chart -- the reference lifters actually use to translate a hard set
/// into an estimated max, since it accounts for how the set felt rather
/// than assuming every set at N reps was taken to failure the way a
/// generic rep-based formula (Epley, Brzycki) does.
///
/// Keyed by RPE*10 (60-100 in steps of 5, i.e. RPE 6.0-10.0 in 0.5 steps --
/// `double` can't be a const map key, since it overrides `==`); each value
/// is percent of 1RM for reps 1-12 in order.
const kRpePercentTable = {
  100: [
    100.0,
    95.5,
    92.2,
    89.2,
    86.3,
    83.7,
    81.1,
    78.6,
    76.2,
    73.9,
    71.6,
    69.4,
  ],
  95: [97.8, 93.9, 90.7, 87.8, 85.0, 82.4, 79.9, 77.4, 75.1, 72.8, 70.6, 68.5],
  90: [95.5, 92.2, 89.2, 86.3, 83.7, 81.1, 78.6, 76.2, 73.9, 71.6, 69.4, 67.4],
  85: [93.9, 90.7, 87.8, 85.0, 82.4, 79.9, 77.4, 75.1, 72.8, 70.6, 68.5, 66.4],
  80: [92.2, 89.2, 86.3, 83.7, 81.1, 78.6, 76.2, 73.9, 71.6, 69.4, 67.4, 65.3],
  75: [90.7, 87.8, 85.0, 82.4, 79.9, 77.4, 75.1, 72.8, 70.6, 68.5, 66.4, 64.4],
  70: [89.2, 86.3, 83.7, 81.1, 78.6, 76.2, 73.9, 71.6, 69.4, 67.4, 65.3, 63.4],
  65: [87.8, 85.0, 82.4, 79.9, 77.4, 75.1, 72.8, 70.6, 68.5, 66.4, 64.4, 62.5],
  60: [86.3, 83.7, 81.1, 78.6, 76.2, 73.9, 71.6, 69.4, 67.4, 65.3, 63.4, 61.5],
};

/// The chart only covers RPE 6-10 -- below that a set is too submaximal
/// for the percent-of-max relationship to hold reliably.
const kMinChartRpe = 6.0;

/// Estimated 1RM for a set of [weight] at [reps] taken to [rpe], or null if
/// [reps] or [rpe] falls outside the chart's supported range.
double? estimateOneRepMax({
  required double weight,
  required int reps,
  required double rpe,
}) {
  final row = kRpePercentTable[(rpe * 10).round()];
  if (row == null || reps < 1 || reps > row.length) return null;
  final percent = row[reps - 1];
  return weight / (percent / 100);
}
