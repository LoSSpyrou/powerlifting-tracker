import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      surface: AppColors.graphite,
      onSurface: AppColors.chalk,
      primary: AppColors.plateBlue,
      onPrimary: AppColors.chalk,
      secondary: AppColors.plateYellow,
      onSecondary: AppColors.graphite,
      error: AppColors.plateRed,
      onError: AppColors.chalk,
    );
    return _build(colorScheme, AppColors.graphite, AppColors.graphiteRaised);
  }

  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      surface: AppColors.steel,
      onSurface: AppColors.ink,
      primary: AppColors.plateBlue,
      onPrimary: AppColors.chalk,
      secondary: AppColors.plateYellow,
      onSecondary: AppColors.ink,
      error: AppColors.plateRed,
      onError: AppColors.chalk,
    );
    return _build(colorScheme, AppColors.steel, AppColors.steelRaised);
  }

  static ThemeData _build(
    ColorScheme colorScheme,
    Color background,
    Color surfaceRaised,
  ) {
    final textTheme = AppTypography.textTheme(colorScheme.onSurface);
    const radius = BorderRadius.all(Radius.circular(4));

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.headlineMedium,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: surfaceRaised,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: radius),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceRaised,
        border: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        labelStyle: textTheme.bodyMedium,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(borderRadius: radius),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: textTheme.labelLarge,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceRaised,
        selectedColor: colorScheme.primary,
        labelStyle: textTheme.labelLarge,
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onPrimary,
        ),
        shape: const RoundedRectangleBorder(borderRadius: radius),
        side: BorderSide.none,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surfaceRaised,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.25),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: surfaceRaised,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.25),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.onSurface.withValues(alpha: 0.08),
      ),
    );
  }
}
