# Powerlifting Tracker

Solo-dev Flutter app for logging powerlifting training sessions, RPE, and
personal records between attempts.

## Tech stack

- Flutter/Dart, state via `flutter_riverpod`
- Persistence via `drift` + `drift_flutter` (`lib/database/`)
- `google_fonts` for typography, `fl_chart` for charts
- `analysis_options.yaml` is stock `package:flutter_lints/flutter.yaml` —
  no custom lint rules

## Structure

- `lib/features/<feature>/` — one folder per feature (`log`, `history`,
  `calculators`, `prs`, `settings`), each with its own `widgets/`
- `lib/database/` — Drift tables and repositories
- `lib/shared/theme/` — design tokens (`AppColors`, `AppTypography`,
  `AppTheme`)
- `lib/shared/models/` — shared data models

## Design system

This app has a deliberate, non-default visual identity (competition
platform under stage lighting, not a generic wellness app). Full rules
auto-load from `.claude/rules/design-system.md` whenever you touch
`lib/**/*.dart` — don't fall back to default Material widgets/colors.

## Verification

Run `/verify` before committing (flutter analyze, flutter test, dart
format check).
