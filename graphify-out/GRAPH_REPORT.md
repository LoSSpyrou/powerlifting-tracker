# Graph Report - powerlifting-tracker  (2026-08-14)

## Corpus Check
- 99 files · ~37,556 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 815 nodes · 1121 edges · 93 communities (46 shown, 47 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 36 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `a6c3e5de`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- database.dart
- Win32Window
- MVP v1 Screens
- app.dart
- log_screen.dart
- history_screen_test.dart
- double? rpe,
  int
- StatelessWidget
- plate_loader_tab.dart
- staggered_animation.dart
- package:flutter_riverpod/flutter_riverpod.dart
- AppDelegate
- set_entry_tile.dart
- app_colors.dart
- @immutable
- State
- plate_math.dart
- explicit_animation.dart
- package:flutter/material.dart
- one_rep_max_tab.dart
- AppPreview
- log_repository.dart
- BorderSide
- history_screen.dart
- Sex
- calculators_screen.dart
- New Screen Skill Workflow
- BoolColumn get
- T
- ../calculators/plate_math.dart
- ../../../core/widgets/hard_rule.dart
- hard_nav_bar.dart
- IconData
- implicit_animation.dart
- wilks_dots_tab.dart
- wilks_dots_math.dart
- ../../models/sessioned_set.dart
- Container
- three_lights.dart
- wWinMain
- dart:async
- log_repository_test.dart
- Lift
- hard_button.dart
- history_chart.dart
- plate_bar_visual.dart
- ../../../../data/repositories/settings_repository.dart
- ../calculators/one_rep_max_table.dart
- rpe_selector.dart
- package:flutter_test/flutter_test.dart
- ../theme/app_theme_tokens.dart
- ../../../../data/repositories/settings_repository_provider.dart
- double? rpe,
  Lift
- wilks_dots_math_test.dart
- package:powerlifting_tracker/ui/features/calculators/views/calculators_screen.dart
- Notifier
- package:flutter/foundation.dart
- log_screen_test.dart
- app_typography.dart
- responsive_content.dart
- package:powerlifting_tracker/data/repositories/settings_repository.dart
- package:powerlifting_tracker/domain/models/sessioned_set.dart
- package:powerlifting_tracker/domain/use_cases/history/group_sets_by_session.dart
- package:powerlifting_tracker/domain/use_cases/prs/best_single.dart
- one_rep_max_table.dart
- package:powerlifting_tracker/ui/core/rest_timer/rest_timer_controller.dart
- app_preview.dart
- package:powerlifting_tracker/ui/core/widgets/hard_button.dart
- dart-add-unit-test Skill
- MainActivity.kt
- adaptive_breakpoints.dart
- Windows Top-level CMake Project Config
- flutter-add-widget-preview Skill
- flutter-build-responsive-layout Skill
- DevTools Configuration
- String?
- package:powerlifting_tracker/ui/core/widgets/hard_nav_bar.dart
- package:powerlifting_tracker/ui/core/widgets/hard_nav_rail.dart
- package:powerlifting_tracker/ui/core/widgets/hard_rule.dart
- package:powerlifting_tracker/ui/core/widgets/numeric_stepper.dart
- package:powerlifting_tracker/ui/core/widgets/rest_timer_overlay.dart
- package:powerlifting_tracker/ui/core/widgets/segmented_control.dart
- package:powerlifting_tracker/ui/features/history/views/session_detail_screen.dart
- required DateTime createdAt,
  double
- ../rest_timer/rest_timer_controller.dart
- settings_repository.dart
- ThemeExtension
- ThemeMode
- Timer?

## God Nodes (most connected - your core abstractions)
1. `Win32Window` - 22 edges
2. `AppPreview` - 14 edges
3. `PLATFORM Design System Rules` - 13 edges
4. `MessageHandler` - 12 edges
5. `FlutterWindow` - 10 edges
6. `Create` - 10 edges
7. `WndProc` - 10 edges
8. `MessageHandler` - 9 edges
9. `WindowClassRegistrar` - 7 edges
10. `OnCreate` - 7 edges

## Surprising Connections (you probably didn't know these)
- `Calculators Use Cases (plate math, 1RM, Wilks/DOTS)` --semantically_similar_to--> `1RM Estimator Feature`  [INFERRED] [semantically similar]
  CLAUDE.md → powerlifting-tracker-mvp-spec.md
- `Calculators Use Cases (plate math, 1RM, Wilks/DOTS)` --semantically_similar_to--> `Plate-Loading Calculator Feature`  [INFERRED] [semantically similar]
  CLAUDE.md → powerlifting-tracker-mvp-spec.md
- `Calculators Use Cases (plate math, 1RM, Wilks/DOTS)` --semantically_similar_to--> `Wilks/DOTS Score Calculator Feature`  [INFERRED] [semantically similar]
  CLAUDE.md → powerlifting-tracker-mvp-spec.md
- `/verify Pre-commit Check` --semantically_similar_to--> `Verify Workflow`  [INFERRED] [semantically similar]
  CLAUDE.md → .github/workflows/verify.yml
- `Tech Stack` --shares_data_with--> `Flutter Package Manifest`  [INFERRED]
  CLAUDE.md → pubspec.yaml

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Pre-commit Design Verification Loop** — _claude_agents_design_system_reviewer_agent, _claude_commands_verify, _claude_rules_design_system_doc [EXTRACTED 1.00]
- **Flutter Animations Resource Routing** — _claude_skills_flutter_animations_skill, _claude_skills_flutter_animations_references_curves, _claude_skills_flutter_animations_references_explicit, _claude_skills_flutter_animations_references_hero, _claude_skills_flutter_animations_references_implicit, _claude_skills_flutter_animations_references_physics, _claude_skills_flutter_animations_references_staggered [EXTRACTED 1.00]
- **CI Workflows Consuming pubspec.yaml** — github_workflows_ios_build_workflow, github_workflows_verify_workflow, pubspec_config [INFERRED 0.85]
- **Dart/Flutter Testing Workflow Skills** — _claude_skills_dart_add_unit_test_skill, _claude_skills_dart_generate_test_mocks_skill, _claude_skills_flutter_add_widget_test_skill [INFERRED 0.85]

## Communities (93 total, 47 thin omitted)

### Community 0 - "database.dart"
Cohesion: 0.03
Nodes (79): _, actualTableName, _alias, aliasedName, allSchemaEntities, allTables, attachedDatabase, autoRestTimer (+71 more)

### Community 1 - "Win32Window"
Cohesion: 0.06
Nodes (54): FlutterViewController, PluginRegistry, Point, RECT, Size, unique_ptr, RegisterPlugins(), DartProject (+46 more)

### Community 2 - "MVP v1 Screens"
Cohesion: 0.12
Nodes (24): Dart Analyzer Configuration, Calculators Use Cases (plate math, 1RM, Wilks/DOTS), Layered data/domain/ui Architecture, Powerlifting Tracker Project Guide, Tech Stack, /verify Pre-commit Check, iOS Build Workflow, Verify Workflow (+16 more)

### Community 3 - "app.dart"
Cohesion: 0.08
Nodes (29): AutomaticKeepAliveClientMixin, ConsumerState, ConsumerStatefulWidget, core/adaptive_breakpoints.dart, ../../../core/rest_timer/rest_timer_controller.dart, core/theme/app_theme.dart, core/widgets/hard_nav_bar.dart, core/widgets/hard_nav_rail.dart (+21 more)

### Community 4 - "log_screen.dart"
Cohesion: 0.09
Nodes (21): double? get, int? get, _ActiveField, _canSubmit, createState, _defaultsApplied, _focusField, _lightsTrigger (+13 more)

### Community 5 - "history_screen_test.dart"
Cohesion: 0.29
Nodes (6): package:powerlifting_tracker/data/services/database_provider.dart, package:powerlifting_tracker/ui/core/theme/app_theme.dart, package:powerlifting_tracker/ui/features/history/views/history_screen.dart, package:powerlifting_tracker/ui/features/history/views/widgets/session_row.dart, main, _usePhoneSurface

### Community 7 - "StatelessWidget"
Cohesion: 0.09
Nodes (25): ExplicitAnimationApp, GrowTransition, LogoAnimationDemo, LogoWidget, CircularDetailScreen, CircularHeroExample, _CircularHeroExampleState, createState (+17 more)

### Community 8 - "plate_loader_tab.dart"
Cohesion: 0.14
Nodes (13): bool get, ../../../core/widgets/hard_button.dart, ../../../../domain/use_cases/calculators/plate_math.dart, _barWeight, build, createState, _presets, _setTarget (+5 more)

### Community 9 - "staggered_animation.dart"
Cohesion: 0.10
Nodes (20): animation, _animationDuration, borderRadius, build, _buildAnimation, color, _controller, createState (+12 more)

### Community 10 - "package:flutter_riverpod/flutter_riverpod.dart"
Cohesion: 0.18
Nodes (8): LogRepository, main, log_repository.dart, package:flutter_riverpod/flutter_riverpod.dart, package:powerlifting_tracker/ui/app.dart, ../services/database_provider.dart, main, ui/app.dart

### Community 11 - "AppDelegate"
Cohesion: 0.11
Nodes (14): Any, Bool, Flutter, FlutterAppDelegate, FlutterImplicitEngineBridge, FlutterImplicitEngineDelegate, FlutterSceneDelegate, AppDelegate (+6 more)

### Community 12 - "set_entry_tile.dart"
Cohesion: 0.14
Nodes (14): ../../../../core/theme/app_theme_tokens.dart, ../../../../core/theme/app_typography.dart, ../../../../data/services/database.dart, ../../../../../domain/models/format_weight.dart, ../../../../../domain/models/lift_display_name.dart, liftDisplayName, entry, lift (+6 more)

### Community 13 - "app_colors.dart"
Cohesion: 0.05
Nodes (40): /verify Command, PLATFORM Design System Rules, Curves Reference, Explicit Animations Reference, Hero Animations Reference, Implicit Animations Reference, Physics-Based Animations Reference, Staggered Animations Reference (+32 more)

### Community 15 - "State"
Cohesion: 0.17
Nodes (21): AnimatedBuilderDemo, _AnimatedBuilderDemoState, AnimatedWidgetDemo, _AnimatedWidgetDemoState, BasicExplicitAnimation, _BasicExplicitAnimationState, MultiPropertyDemo, _MultiPropertyDemoState (+13 more)

### Community 16 - "plate_math.dart"
Cohesion: 0.11
Nodes (17): achievedPerSide, achievedTotal, calculatePlates, denominations, epsilon, kMaxPlateLoaderWeightKg, kMensBarKg, kSmallestLoadableIncrementKg (+9 more)

### Community 17 - "explicit_animation.dart"
Cohesion: 0.12
Nodes (17): AnimatedWidget, Animation, AnimatedLogo, _animation, build, child, _colorTween, _controller (+9 more)

### Community 18 - "package:flutter/material.dart"
Cohesion: 0.29
Nodes (6): ../../../core/app_preview.dart, build, PrsScreen, build, SettingsScreen, package:flutter/material.dart

### Community 19 - "one_rep_max_tab.dart"
Cohesion: 0.13
Nodes (14): ../../../core/widgets/rpe_selector.dart, ../../../../domain/use_cases/calculators/one_rep_max_table.dart, build, createState, note, percent, _percentRows, _reps (+6 more)

### Community 20 - "AppPreview"
Cohesion: 0.25
Nodes (8): AppPreview, rpeSelectorPreview, plateBarVisualPreview, historyChartPreview, historySetRowPreview, setEntryTilePreview, threeLightsPreview, Preview

### Community 21 - "log_repository.dart"
Cohesion: 0.05
Nodes (41): @DataClassName, DateTime get, DateTimeColumn get, ../../../../../domain/models/lift_type.dart, ../../../../../domain/models/sessioned_set.dart, IntColumn get, _db, deleteSet (+33 more)

### Community 23 - "history_screen.dart"
Cohesion: 0.07
Nodes (38): Color, ConsumerWidget, ../../../../../data/repositories/log_repository_provider.dart, ../../../../../domain/models/logged_set.dart, ../../../../../domain/use_cases/history/group_sets_by_session.dart, history_vm, logRepositoryProvider, PowerliftingTrackerApp (+30 more)

### Community 25 - "calculators_screen.dart"
Cohesion: 0.15
Nodes (12): ../../../core/widgets/responsive_content.dart, ../../../core/widgets/segmented_control.dart, build, _controller, createState, dispose, _onTabChanged, _titles (+4 more)

### Community 26 - "New Screen Skill Workflow"
Cohesion: 0.40
Nodes (5): design-system-reviewer Subagent, Root Shell Screen Wiring Pattern, Sport-Specific Design Principle, ThreeLights Widget, New Screen Skill Workflow

### Community 33 - "implicit_animation.dart"
Cohesion: 0.16
Nodes (14): class, _animated, AnimatedContainerExample, _AnimatedContainerExampleState, build, createState, _expanded, FadeExample (+6 more)

### Community 34 - "wilks_dots_tab.dart"
Cohesion: 0.14
Nodes (13): ../../../../core/widgets/numeric_stepper.dart, ../../../../../domain/models/sex.dart, ../../../../../domain/use_cases/calculators/wilks_dots_math.dart, ../../../../../domain/use_cases/prs/best_single.dart, _bodyweight, createState, _liftColors, _liftLabels (+5 more)

### Community 35 - "wilks_dots_math.dart"
Cohesion: 0.08
Nodes (21): _, @DriftDatabase, database.dart, AppDatabase, databaseProvider, db, formatWeight, value (+13 more)

### Community 38 - "three_lights.dart"
Cohesion: 0.20
Nodes (9): AnimationController, ../../../../core/theme/app_colors.dart, build, _controller, createState, didUpdateWidget, dispose, initState (+1 more)

### Community 39 - "wWinMain"
Cohesion: 0.24
Nodes (9): _In_, _In_opt_, vector, wWinMain(), string, wchar_t, CreateAndAttachConsole(), GetCommandLineArguments() (+1 more)

### Community 41 - "log_repository_test.dart"
Cohesion: 0.20
Nodes (9): package:drift/native.dart, package:powerlifting_tracker/data/repositories/log_repository.dart, package:powerlifting_tracker/data/services/database.dart, package:powerlifting_tracker/domain/models/lift_display_name.dart, package:powerlifting_tracker/domain/models/lift_type.dart, db, main, repository (+1 more)

### Community 42 - "Lift"
Cohesion: 0.29
Nodes (11): AppSetting, AppSettingsCompanion, Lift, LiftsCompanion, Session, SessionsCompanion, SetEntriesCompanion, SetEntry (+3 more)

### Community 44 - "history_chart.dart"
Cohesion: 0.18
Nodes (10): int?, build, _dayMs, highlightedIndex, HistoryChart, lift, now, onHover (+2 more)

### Community 45 - "plate_bar_visual.dart"
Cohesion: 0.18
Nodes (10): build, _colors, _heights, _key, _outline, perSidePlates, PlateBarVisual, List (+2 more)

### Community 48 - "rpe_selector.dart"
Cohesion: 0.17
Nodes (11): ../app_preview.dart, double?, build, minRpe, onChanged, RpeSelector, value, _values (+3 more)

### Community 49 - "package:flutter_test/flutter_test.dart"
Cohesion: 0.15
Nodes (9): package:flutter_test/flutter_test.dart, package:powerlifting_tracker/domain/models/format_weight.dart, package:powerlifting_tracker/domain/use_cases/calculators/one_rep_max_table.dart, package:powerlifting_tracker/domain/use_cases/calculators/plate_math.dart, package:powerlifting_tracker/ui/core/widgets/rpe_selector.dart, main, main, main (+1 more)

### Community 53 - "wilks_dots_math_test.dart"
Cohesion: 0.50
Nodes (3): package:powerlifting_tracker/domain/models/sex.dart, package:powerlifting_tracker/domain/use_cases/calculators/wilks_dots_math.dart, main

### Community 57 - "log_screen_test.dart"
Cohesion: 0.25
Nodes (7): package:powerlifting_tracker/ui/features/log/views/log_screen.dart, _enterWeightAndReps, main, _numpadKey, pump, tap, _usePhoneSurface

### Community 58 - "app_typography.dart"
Cohesion: 0.29
Nodes (6): design-system-reviewer Agent, AppTypography, numeric, oswald, textTheme, package:google_fonts/google_fonts.dart

### Community 59 - "responsive_content.dart"
Cohesion: 0.29
Nodes (6): ../adaptive_breakpoints.dart, build, child, maxWidth, ResponsiveContent, Widget

### Community 64 - "one_rep_max_table.dart"
Cohesion: 0.33
Nodes (5): estimateOneRepMax, kMinChartRpe, kRpePercentTable, percent, row

### Community 66 - "app_preview.dart"
Cohesion: 0.40
Nodes (4): _theme, transform, package:flutter/widget_previews.dart, theme/app_theme.dart

### Community 68 - "dart-add-unit-test Skill"
Cohesion: 0.67
Nodes (3): dart-add-unit-test Skill, dart-generate-test-mocks Skill, flutter-add-widget-test Skill

### Community 71 - "Windows Top-level CMake Project Config"
Cohesion: 1.00
Nodes (3): Windows Top-level CMake Project Config, Windows Flutter Library Build Rules, Windows Runner Executable Target

## Knowledge Gaps
- **338 isolated node(s):** `_`, `actualTableName`, `_alias`, `aliasedName`, `allSchemaEntities` (+333 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **47 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `AppDatabase` connect `wilks_dots_math.dart` to `database.dart`, `log_repository_test.dart`, `log_repository.dart`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **Why does `PLATFORM Design System Rules` connect `app_colors.dart` to `app_typography.dart`?**
  _High betweenness centrality (0.016) - this node is a cross-community bridge._
- **Why does `AppPreview` connect `AppPreview` to `package:flutter/material.dart`, `app_preview.dart`, `app.dart`, `State`?**
  _High betweenness centrality (0.014) - this node is a cross-community bridge._
- **What connects `_`, `actualTableName`, `_alias` to the rest of the system?**
  _338 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `database.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.025 - nodes in this community are weakly interconnected._
- **Should `Win32Window` be split into smaller, more focused modules?**
  _Cohesion score 0.05837173579109063 - nodes in this community are weakly interconnected._
- **Should `MVP v1 Screens` be split into smaller, more focused modules?**
  _Cohesion score 0.11594202898550725 - nodes in this community are weakly interconnected._