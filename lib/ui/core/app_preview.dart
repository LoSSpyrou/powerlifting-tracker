import 'package:flutter/widget_previews.dart';

import 'theme/app_theme.dart';

/// Renders previews under this app's own light/dark theme (the graphite
/// competition-platform look, see `.claude/rules/design-system.md`) instead
/// of stock Material defaults, so a preview reflects what the widget
/// actually looks like in the app.
final class AppPreview extends Preview {
  const AppPreview({super.name, super.group, super.size});

  PreviewThemeData _theme() => PreviewThemeData(
    materialLight: AppTheme.light,
    materialDark: AppTheme.dark,
  );

  @override
  Preview transform() {
    final builder = super.transform().toBuilder()..theme = _theme;
    return builder.build();
  }
}
