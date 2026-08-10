import '../../shared/models/sex.dart';

/// DOTS is the coefficient IPF-style federations currently use to compare
/// totals across bodyweights for Best Lifter awards, superseding Wilks.
double calculateDots({
  required Sex sex,
  required double bodyweightKg,
  required double totalKg,
}) {
  final bw = bodyweightKg.clamp(
    sex == Sex.male ? 40.0 : 40.0,
    sex == Sex.male ? 210.0 : 150.0,
  );
  final coeffs = sex == Sex.male ? _dotsMenCoeffs : _dotsWomenCoeffs;
  return totalKg * 500 / _polynomial(coeffs, bw);
}

/// The original (1994) Wilks coefficient -- superseded by DOTS, but still
/// widely reported alongside it.
double calculateWilks({
  required Sex sex,
  required double bodyweightKg,
  required double totalKg,
}) {
  final coeffs = sex == Sex.male ? _wilksMenCoeffs : _wilksWomenCoeffs;
  return totalKg * 500 / _polynomial(coeffs, bodyweightKg);
}

double _polynomial(List<double> coefficients, double x) {
  var result = 0.0;
  var power = 1.0;
  for (final c in coefficients) {
    result += c * power;
    power *= x;
  }
  return result;
}

const _dotsMenCoeffs = [
  -307.75076,
  24.0900756,
  -0.1918759221,
  0.0007391293,
  -0.000001093,
];
const _dotsWomenCoeffs = [
  57.96288,
  13.6175032,
  -0.1126655495,
  0.0005158568,
  -0.0000010706,
];

const _wilksMenCoeffs = [
  -216.0475144,
  16.2606339,
  -0.002388645,
  -0.00113732,
  7.01863e-6,
  -1.291e-8,
];
const _wilksWomenCoeffs = [
  594.31747775582,
  -27.23842536447,
  0.82112226871,
  -0.00930733913,
  4.731582e-5,
  -9.054e-8,
];
