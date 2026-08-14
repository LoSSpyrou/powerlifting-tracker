# Powerlifting Tracker

Solo-dev Flutter app for logging powerlifting training sessions, RPE, and
personal records between attempts.

## Tech stack

- Flutter/Dart, state via `flutter_riverpod` (Riverpod providers/notifiers
  fill the ViewModel role in the layering below)
- Persistence via `drift` + `drift_flutter` (`lib/data/services/`)
- `google_fonts` for typography, `fl_chart` for charts
- `analysis_options.yaml` is stock `package:flutter_lints/flutter.yaml` —
  no custom lint rules

## Structure

Layered `data` / `domain` / `ui` architecture — data and domain are
grouped by type, UI is grouped by feature:

- `lib/data/services/` — Drift database, tables, and the `Provider` that
  constructs it
- `lib/data/repositories/` — repositories consuming the database and
  exposing domain models
- `lib/domain/models/` — shared domain models and enums (`LiftType`,
  `Sex`, `LoggedSet`, `formatWeight`, `liftDisplayName`)
- `lib/domain/use_cases/` — pure business logic with no UI or data-layer
  dependencies (e.g. `calculators/` — plate math, 1RM, Wilks/DOTS)
- `lib/ui/core/` — cross-feature theme (`AppColors`, `AppTypography`,
  `AppTheme`) and shared widgets used by more than one feature
  (`LiftSelector`, `RpeSelector`)
- `lib/ui/features/<feature>/` — one folder per feature (`log`, `history`,
  `calculators`, `prs`, `settings`), each with `views/` (screen +
  feature-local `widgets/`) and, where the feature has Riverpod state,
  `view_models/`
- `lib/ui/app.dart` — root widget and bottom-nav shell

When a widget or provider is used by more than one feature, it belongs in
`lib/ui/core/` (or `lib/domain/`), not inside a single feature's folder.

## Design system

This app has a deliberate, non-default visual identity (competition
platform under stage lighting, not a generic wellness app). Full rules
auto-load from `.claude/rules/design-system.md` whenever you touch
`lib/**/*.dart` — don't fall back to default Material widgets/colors.

## Verification

Run `/verify` before committing (flutter analyze, flutter test, dart
format check).

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
