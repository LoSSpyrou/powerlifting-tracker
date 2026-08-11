/// Standard competition plate denominations (kg), heaviest first -- the
/// set every IPF-style meet actually has on the platform.
const kStandardPlatesKg = [25.0, 20.0, 15.0, 10.0, 5.0, 2.5, 1.25];

/// Standard bar weights (kg) for the men's and women's competition bars.
const kMensBarKg = 20.0;
const kWomensBarKg = 15.0;

/// The heaviest single competition lift on record -- Jimmy Kolb's 611.3kg
/// (1348lb) equipped bench press, 2023 -- plus a 100kg buffer, rounded.
/// A ceiling on the target weight so a stray extra digit doesn't ask
/// [calculatePlates] to greedily fill a many-thousand-kg bar.
const kMaxPlateLoaderWeightKg = 715.0;

class PlateBreakdown {
  const PlateBreakdown({required this.perSide, required this.achievedTotal});

  /// Plates for one side of the bar, heaviest first (loaded innermost,
  /// against the collar, the way it's actually done on the platform).
  final List<double> perSide;

  /// The total actually achievable with the given denominations -- may
  /// fall slightly short of the requested target if it doesn't divide
  /// evenly.
  final double achievedTotal;
}

/// Greedily fills each side of the bar from heaviest to lightest plate,
/// the way a lifter loads a bar, rather than solving for an exact (and
/// sometimes physically unloadable) combination.
PlateBreakdown calculatePlates({
  required double targetWeight,
  required double barWeight,
  List<double> denominations = kStandardPlatesKg,
}) {
  final perSideTarget = (targetWeight - barWeight) / 2;
  if (perSideTarget <= 0) {
    return PlateBreakdown(perSide: const [], achievedTotal: barWeight);
  }

  const epsilon = 1e-9;
  var remaining = perSideTarget;
  final plates = <double>[];
  for (final plate in denominations) {
    while (remaining + epsilon >= plate) {
      plates.add(plate);
      remaining -= plate;
    }
  }

  final achievedPerSide = perSideTarget - remaining;
  return PlateBreakdown(
    perSide: plates,
    achievedTotal: barWeight + achievedPerSide * 2,
  );
}

/// Smallest total-weight step achievable with the standard set: plates go
/// on in pairs, so the lightest plate (1.25kg) only ever moves the total by
/// double itself.
const kSmallestLoadableIncrementKg = 2.5;

/// Rounds [weightKg] to the nearest weight actually loadable with standard
/// plates, so a calculated number (an estimated max, a training percentage)
/// reads as a weight you could put on the bar rather than raw math.
double roundToLoadable(
  double weightKg, {
  double increment = kSmallestLoadableIncrementKg,
}) => (weightKg / increment).round() * increment;
