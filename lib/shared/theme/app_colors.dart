import 'package:flutter/material.dart';

/// Color tokens borrowed from IPF-calibrated competition plate colors
/// (5kg white, 10kg green, 15kg yellow, 20kg blue, 25kg red), which happen
/// to run light-to-heavy in the same order RPE runs low-to-high effort.
/// Used both as the RPE intensity gradient and as semantic UI accents.
class AppColors {
  AppColors._();

  // Dark theme neutrals — a competition platform under stage lighting.
  static const graphite = Color(0xFF15171B);
  static const graphiteRaised = Color(0xFF1F2227);
  static const chalk = Color(0xFFEDEDEA);

  // Light theme neutrals.
  static const steel = Color(0xFFE7E8EA);
  static const steelRaised = Color(0xFFF3F4F6);
  static const ink = Color(0xFF1B1D21);

  // Plate colors, light-to-heavy.
  static const plateWhite = chalk;
  static const plateGreen = Color(0xFF3F7D45);
  static const plateYellow = Color(0xFFD9A93B);
  static const plateBlue = Color(0xFF2F5D9E);
  static const plateRed = Color(0xFFC23B32);

  static const _rpeRamp = [
    plateWhite,
    plateGreen,
    plateYellow,
    plateBlue,
    plateRed,
  ];

  /// Interpolates the plate-color progression across the 1-10 RPE range.
  static Color rpeColor(double rpe) {
    final t = ((rpe - 1) / 9).clamp(0.0, 1.0);
    final scaled = t * (_rpeRamp.length - 1);
    final index = scaled.floor().clamp(0, _rpeRamp.length - 2);
    final localT = scaled - index;
    return Color.lerp(_rpeRamp[index], _rpeRamp[index + 1], localT)!;
  }
}
