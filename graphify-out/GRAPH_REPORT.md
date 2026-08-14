# Graph Report - powerlifting-tracker  (2026-08-14)

## Corpus Check
- 163 files · ~54,636 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1100 nodes · 1661 edges · 80 communities (74 shown, 6 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 44 edges (avg confidence: 0.82)
- Token cost: 235,006 input · 0 output

## Community Hubs (Navigation)
- Drift Database Layer
- Windows Flutter Embedding Runtime
- Project Documentation & Specs
- Root Shell & App Screens
- Log Screen Feature
- Core Widget Test Suite
- History & PRs Domain Tests
- Animation Templates & Misc Widgets
- Calculators & History Screen State
- Staggered Animation Template
- App Entry Point & Repo Providers
- iOS Runner Platform Code
- Domain Models & Set Display Widgets
- AppColors Theme Tokens
- Rest Timer Controller
- Animation Demo State Classes
- Plate Math Calculator
- Explicit Animation Template
- Widget Preview Gallery
- One Rep Max Calculator Tab
- Session Row Widget
- Log Repository
- Numeric Stepper Widget
- History Screen
- Settings Table & Sex Model
- Calculators Screen Shell
- Settings Repository
- App Theme Tokens
- Segmented Control Widget
- History & Log View Providers
- Session Detail Screen
- Hard Nav Rail Widget
- Hard Nav Bar Widget
- Implicit Animation Template
- Wilks/DOTS Calculator Tab
- Wilks/DOTS Math
- Group Sets By Session
- Hard Button Widget
- Three Lights Indicator Widget
- Windows Runner Entry & Utils
- Set Entries & Lift Tables
- History & Log Repository Tests
- Drift Generated Data Classes
- Rest Timer Overlay Widget
- History Chart Widget
- Plate Bar Visual Widget
- Design System Rules & Rationale
- Best Single PR Calculation
- RPE Selector Widget
- Calculator & FormatWeight Tests
- Theme Tokens & Hard Rule Widget
- Numpad Widget
- Lift Type Model & Table
- Settings & Wilks/DOTS Tests
- Calculators Screen Tests
- Flutter Animation Skill References
- Database Provider & FormatWeight
- Log Screen Tests
- App Typography & Design Reviewer Agent
- Responsive Content Widget
- Drift Table Definitions
- App Theme Builder
- SessionedSet Model
- Sessions Table Columns
- One Rep Max Table Use Case
- History View Models
- App Preview Theme Helpers
- Misc Animation/Test Fragment
- Dart Testing Skills
- Android MainActivity
- Adaptive Breakpoints Constants
- Windows CMake Build Chain
- Widget Preview Skill
- Responsive Layout Skill
- DevTools Options Config
- Unresolved String Literal

## God Nodes (most connected - your core abstractions)
1. `AppPreview` - 24 edges
2. `AppThemeTokens` - 24 edges
3. `Win32Window` - 22 edges
4. `PLATFORM Design System Rules` - 14 edges
5. `MessageHandler` - 12 edges
6. `PLATFORM Design Spec` - 12 edges
7. `FlutterWindow` - 10 edges
8. `Create` - 10 edges
9. `WndProc` - 10 edges
10. `MVP v1 Screens` - 10 edges

## Surprising Connections (you probably didn't know these)
- `MVP v1 Screens` --semantically_similar_to--> `Log Screen Spec`  [INFERRED] [semantically similar]
  powerlifting-tracker-mvp-spec.md → docs/design/platform-design-spec.md
- `MVP v1 Screens` --semantically_similar_to--> `History Screen Spec`  [INFERRED] [semantically similar]
  powerlifting-tracker-mvp-spec.md → docs/design/platform-design-spec.md
- `Rest Timer Overlay` --semantically_similar_to--> `Root Shell Screen Wiring Pattern`  [INFERRED] [semantically similar]
  docs/design/platform-design-spec.md → .claude/skills/new-screen/SKILL.md
- `/verify Pre-commit Check` --semantically_similar_to--> `Verify Workflow`  [INFERRED] [semantically similar]
  CLAUDE.md → .github/workflows/verify.yml
- `Calculators Use Cases (plate math, 1RM, Wilks/DOTS)` --semantically_similar_to--> `1RM Estimator Feature`  [INFERRED] [semantically similar]
  CLAUDE.md → powerlifting-tracker-mvp-spec.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Flutter Animations Resource Routing** — _claude_skills_flutter_animations_skill, _claude_skills_flutter_animations_references_curves, _claude_skills_flutter_animations_references_explicit, _claude_skills_flutter_animations_references_hero, _claude_skills_flutter_animations_references_implicit, _claude_skills_flutter_animations_references_physics, _claude_skills_flutter_animations_references_staggered [EXTRACTED 1.00]
- **Dart/Flutter Testing Workflow Skills** — _claude_skills_dart_add_unit_test_skill, _claude_skills_dart_generate_test_mocks_skill, _claude_skills_flutter_add_widget_test_skill [INFERRED 0.85]
- **Pre-commit Design Verification Loop** — _claude_agents_design_system_reviewer_agent, _claude_commands_verify, _claude_rules_design_system_doc [EXTRACTED 1.00]
- **CI Workflows Consuming pubspec.yaml** — github_workflows_ios_build_workflow, github_workflows_verify_workflow, pubspec_config [INFERRED 0.85]
- **Calculators Feature Across Specs and Code** — powerlifting_tracker_mvp_spec_plate_calculator_feature, powerlifting_tracker_mvp_spec_1rm_estimator_feature, powerlifting_tracker_mvp_spec_wilks_dots_feature, claude_domain_use_cases_calculators, docs_design_platform_design_spec_calculators_screen [INFERRED 0.85]
- **PLATFORM Design Documentation Chain** — docs_design_platform_app_mockup_export, docs_design_platform_design_spec_overview, claude_project_overview [INFERRED 0.80]

## Communities (80 total, 6 thin omitted)

### Community 0 - "Drift Database Layer"
Cohesion: 0.03
Nodes (78): _, actualTableName, _alias, aliasedName, allSchemaEntities, allTables, attachedDatabase, autoRestTimer (+70 more)

### Community 1 - "Windows Flutter Embedding Runtime"
Cohesion: 0.06
Nodes (54): FlutterViewController, PluginRegistry, Point, RECT, Size, unique_ptr, RegisterPlugins(), DartProject (+46 more)

### Community 2 - "Project Documentation & Specs"
Cohesion: 0.06
Nodes (45): Dart Analyzer Configuration, Calculators Use Cases (plate math, 1RM, Wilks/DOTS), Layered data/domain/ui Architecture, Powerlifting Tracker Project Guide, design-system-reviewer Subagent, Root Shell Screen Wiring Pattern, Sport-Specific Design Principle, ThreeLights Widget (+37 more)

### Community 3 - "Root Shell & App Screens"
Cohesion: 0.07
Nodes (31): core/adaptive_breakpoints.dart, ../../../core/rest_timer/rest_timer_controller.dart, core/theme/app_theme.dart, core/widgets/hard_nav_bar.dart, core/widgets/hard_nav_rail.dart, core/widgets/rest_timer_overlay.dart, ../../../../data/repositories/settings_repository.dart, ../../../../data/repositories/settings_repository_provider.dart (+23 more)

### Community 4 - "Log Screen Feature"
Cohesion: 0.08
Nodes (28): double? get, int? get, logRepositoryProvider, _ActiveField, _applyLastSetDefaults, _canSubmit, createState, _defaultsApplied (+20 more)

### Community 5 - "Core Widget Test Suite"
Cohesion: 0.09
Nodes (20): Container, package:flutter/material.dart, package:powerlifting_tracker/ui/core/theme/app_theme.dart, package:powerlifting_tracker/ui/core/widgets/hard_button.dart, package:powerlifting_tracker/ui/core/widgets/hard_nav_bar.dart, package:powerlifting_tracker/ui/core/widgets/hard_nav_rail.dart, package:powerlifting_tracker/ui/core/widgets/hard_rule.dart, package:powerlifting_tracker/ui/core/widgets/numeric_stepper.dart (+12 more)

### Community 6 - "History & PRs Domain Tests"
Cohesion: 0.09
Nodes (22): double? rpe,
  int, double? rpe,
  Lift, package:powerlifting_tracker/data/services/database.dart, package:powerlifting_tracker/domain/models/lift_display_name.dart, package:powerlifting_tracker/domain/models/lift_type.dart, package:powerlifting_tracker/domain/models/sessioned_set.dart, package:powerlifting_tracker/domain/use_cases/history/group_sets_by_session.dart, package:powerlifting_tracker/domain/use_cases/prs/best_single.dart (+14 more)

### Community 7 - "Animation Templates & Misc Widgets"
Cohesion: 0.09
Nodes (24): GrowTransition, LogoWidget, CircularDetailScreen, createState, DetailScreen, GalleryScreen, HeroAnimationApp, index (+16 more)

### Community 8 - "Calculators & History Screen State"
Cohesion: 0.10
Nodes (23): AutomaticKeepAliveClientMixin, bool get, ConsumerState, ConsumerStatefulWidget, ../../../core/widgets/hard_button.dart, ../../../../domain/use_cases/calculators/plate_math.dart, _barWeight, build (+15 more)

### Community 9 - "Staggered Animation Template"
Cohesion: 0.10
Nodes (20): animation, _animationDuration, borderRadius, build, _buildAnimation, color, _controller, createState (+12 more)

### Community 10 - "App Entry Point & Repo Providers"
Cohesion: 0.10
Nodes (15): LogRepository, settingsRepositoryProvider, SettingsRepository, main, log_repository.dart, package:flutter_riverpod/flutter_riverpod.dart, package:powerlifting_tracker/ui/app.dart, package:powerlifting_tracker/ui/core/rest_timer/rest_timer_controller.dart (+7 more)

### Community 11 - "iOS Runner Platform Code"
Cohesion: 0.11
Nodes (14): Any, Bool, Flutter, FlutterAppDelegate, FlutterImplicitEngineBridge, FlutterImplicitEngineDelegate, FlutterSceneDelegate, AppDelegate (+6 more)

### Community 12 - "Domain Models & Set Display Widgets"
Cohesion: 0.13
Nodes (16): ../../../../core/theme/app_colors.dart, ../../../../core/theme/app_typography.dart, ../../../../data/services/database.dart, ../../../../../domain/models/format_weight.dart, ../../../../../domain/models/lift_display_name.dart, liftDisplayName, entry, lift (+8 more)

### Community 13 - "AppColors Theme Tokens"
Cohesion: 0.10
Nodes (19): AppColors, chalk, chalkDangerBg, chalkStage, chalkSurface, graphite, ink, nightDangerBg (+11 more)

### Community 14 - "Rest Timer Controller"
Cohesion: 0.11
Nodes (18): @immutable, dart:async, addThirty, build, copyWith, isRunning, lastSetSummary, remainingSeconds (+10 more)

### Community 15 - "Animation Demo State Classes"
Cohesion: 0.18
Nodes (19): AnimatedBuilderDemo, _AnimatedBuilderDemoState, AnimatedWidgetDemo, _AnimatedWidgetDemoState, BasicExplicitAnimation, _BasicExplicitAnimationState, MultiPropertyDemo, _MultiPropertyDemoState (+11 more)

### Community 16 - "Plate Math Calculator"
Cohesion: 0.11
Nodes (17): achievedPerSide, achievedTotal, calculatePlates, denominations, epsilon, kMaxPlateLoaderWeightKg, kMensBarKg, kSmallestLoadableIncrementKg (+9 more)

### Community 17 - "Explicit Animation Template"
Cohesion: 0.12
Nodes (16): AnimatedWidget, Animation, AnimatedLogo, _animation, child, _colorTween, _controller, createState (+8 more)

### Community 18 - "Widget Preview Gallery"
Cohesion: 0.12
Nodes (15): ../../../core/app_preview.dart, AppPreview, hardButtonPreview, hardNavBarPreview, numericStepperPreview, segmentedControlPreview, sessionDetailScreenPreview, historyChartPreview (+7 more)

### Community 19 - "One Rep Max Calculator Tab"
Cohesion: 0.12
Nodes (16): ../../../core/widgets/rpe_selector.dart, ../../../../domain/use_cases/calculators/one_rep_max_table.dart, build, createState, note, OneRepMaxTab, _OneRepMaxTabState, percent (+8 more)

### Community 20 - "Session Row Widget"
Cohesion: 0.12
Nodes (16): bench, build, count, day, formatSessionDate, group, liftNames, month (+8 more)

### Community 21 - "Log Repository"
Cohesion: 0.12
Nodes (15): _, @DriftDatabase, DateTime get, _db, deleteSet, _endOfToday, lastSetForLift, logSet (+7 more)

### Community 22 - "Numeric Stepper Widget"
Cohesion: 0.12
Nodes (15): BorderSide, borderOnLeft, borderSide, build, buttonSize, fg, fontSize, label (+7 more)

### Community 23 - "History Screen"
Cohesion: 0.12
Nodes (15): color, createState, _HistoryTab, _hoveredIndex, label, onHover, onLiftSelected, _selectedLiftId (+7 more)

### Community 24 - "Settings Table & Sex Model"
Cohesion: 0.13
Nodes (13): BoolColumn get, ../../../../../domain/models/sex.dart, autoRestTimer, bodyweightKg, haptics, id, plateInventoryKg, restTimerSeconds (+5 more)

### Community 25 - "Calculators Screen Shell"
Cohesion: 0.14
Nodes (14): ../../../core/widgets/responsive_content.dart, ../../../core/widgets/segmented_control.dart, build, CalculatorsScreen, _CalculatorsScreenState, _controller, createState, dispose (+6 more)

### Community 26 - "Settings Repository"
Cohesion: 0.13
Nodes (14): _db, parsePlateInventory, split, updateAutoRestTimer, updateBodyweight, updateHaptics, updatePlateInventory, updateRestTimerSeconds (+6 more)

### Community 27 - "App Theme Tokens"
Cohesion: 0.13
Nodes (14): bg, copyWith, dangerBg, dim, faint, fg, fromNeutrals, hair (+6 more)

### Community 28 - "Segmented Control Widget"
Cohesion: 0.13
Nodes (14): build, fontSize, height, item, label, onChanged, onTap, SegmentedControl (+6 more)

### Community 29 - "History & Log View Providers"
Cohesion: 0.22
Nodes (13): ConsumerWidget, ../../../../../domain/models/logged_set.dart, history_vm, build, _TotalBreakdown, build, _SessionsView, _TrendView (+5 more)

### Community 30 - "Session Detail Screen"
Cohesion: 0.14
Nodes (13): ../../../core/widgets/hard_rule.dart, ../../../../../domain/use_cases/history/group_sets_by_session.dart, bench, build, day, group, label, SessionDetailScreen (+5 more)

### Community 31 - "Hard Nav Rail Widget"
Cohesion: 0.14
Nodes (13): hard_nav_bar.dart, HardNavItem, build, HardNavRail, hardNavRailPreview, item, items, onSelected (+5 more)

### Community 32 - "Hard Nav Bar Widget"
Cohesion: 0.14
Nodes (13): IconData, build, HardNavBar, icon, item, items, label, _NavCell (+5 more)

### Community 33 - "Implicit Animation Template"
Cohesion: 0.18
Nodes (12): class, _animated, build, createState, _expanded, FadeExample, _FadeExampleState, ImplicitAnimationApp (+4 more)

### Community 34 - "Wilks/DOTS Calculator Tab"
Cohesion: 0.15
Nodes (12): ../../../../core/widgets/numeric_stepper.dart, ../../../../../domain/use_cases/calculators/wilks_dots_math.dart, ../../../../../domain/use_cases/prs/best_single.dart, _bodyweight, createState, _liftColors, _liftLabels, _liftOrder (+4 more)

### Community 35 - "Wilks/DOTS Math"
Cohesion: 0.15
Nodes (12): bw, calculateDots, calculateWilks, coeffs, _dotsMenCoeffs, _dotsWomenCoeffs, _polynomial, power (+4 more)

### Community 36 - "Group Sets By Session"
Cohesion: 0.15
Nodes (12): avgRpe, bySession, date, groups, groupSetsBySession, SessionGroup, sessionId, sets (+4 more)

### Community 37 - "Hard Button Widget"
Cohesion: 0.15
Nodes (12): build, color, _contrastColor, fontSize, HardButton, HardButtonVariant, height, label (+4 more)

### Community 38 - "Three Lights Indicator Widget"
Cohesion: 0.18
Nodes (11): AnimationController, build, _controller, createState, didUpdateWidget, dispose, initState, ThreeLights (+3 more)

### Community 39 - "Windows Runner Entry & Utils"
Cohesion: 0.24
Nodes (9): _In_, _In_opt_, vector, wWinMain(), string, wchar_t, CreateAndAttachConsole(), GetCommandLineArguments() (+1 more)

### Community 40 - "Set Entries & Lift Tables"
Cohesion: 0.17
Nodes (11): createdAt, id, liftId, reps, rpe, sessionId, unit, weight (+3 more)

### Community 41 - "History & Log Repository Tests"
Cohesion: 0.18
Nodes (10): package:drift/native.dart, package:powerlifting_tracker/data/repositories/log_repository.dart, package:powerlifting_tracker/data/services/database_provider.dart, package:powerlifting_tracker/ui/features/history/views/history_screen.dart, package:powerlifting_tracker/ui/features/history/views/widgets/session_row.dart, db, main, repository (+2 more)

### Community 42 - "Drift Generated Data Classes"
Cohesion: 0.29
Nodes (11): AppSetting, AppSettingsCompanion, Lift, LiftsCompanion, Session, SessionsCompanion, SetEntriesCompanion, SetEntry (+3 more)

### Community 43 - "Rest Timer Overlay Widget"
Cohesion: 0.18
Nodes (10): Color, hard_button.dart, _Caption, _clock, color, restTimerOverlayPreview, text, _urgentThresholdSeconds (+2 more)

### Community 44 - "History Chart Widget"
Cohesion: 0.18
Nodes (10): int?, build, _dayMs, highlightedIndex, HistoryChart, lift, now, onHover (+2 more)

### Community 45 - "Plate Bar Visual Widget"
Cohesion: 0.18
Nodes (10): build, _colors, _heights, _key, _outline, perSidePlates, PlateBarVisual, plateBarVisualPreview (+2 more)

### Community 46 - "Design System Rules & Rationale"
Cohesion: 0.20
Nodes (8): /verify Command, PLATFORM Design System Rules, flutter-apply-architecture-best-practices Skill, Bespoke Hard-UI Widgets Pattern, PLATFORM Visual Identity, Ramp Color Contrast Rule, AppColors.rpeColor RPE Ramp, Zero Border Radius Decision

### Community 47 - "Best Single PR Calculation"
Cohesion: 0.20
Nodes (9): ../calculators/one_rep_max_table.dart, ../calculators/plate_math.dart, double?, bestEstimate, BestSingle, bestSingleOrEstimate, isEstimated, singles (+1 more)

### Community 48 - "RPE Selector Widget"
Cohesion: 0.20
Nodes (9): build, minRpe, onChanged, RpeSelector, rpeSelectorPreview, value, _values, ../theme/app_typography.dart (+1 more)

### Community 49 - "Calculator & FormatWeight Tests"
Cohesion: 0.20
Nodes (7): package:flutter_test/flutter_test.dart, package:powerlifting_tracker/domain/models/format_weight.dart, package:powerlifting_tracker/domain/use_cases/calculators/one_rep_max_table.dart, package:powerlifting_tracker/domain/use_cases/calculators/plate_math.dart, main, main, main

### Community 50 - "Theme Tokens & Hard Rule Widget"
Cohesion: 0.25
Nodes (8): ../app_preview.dart, AppThemeTokens, build, Hairline, HardRule, hardRuleHairlinePreview, ../theme/app_theme_tokens.dart, ThemeExtension

### Community 51 - "Numpad Widget"
Cohesion: 0.22
Nodes (8): ../../../../core/theme/app_theme_tokens.dart, build, _keys, maxLength, Numpad, onChanged, _press, value

### Community 52 - "Lift Type Model & Table"
Cohesion: 0.22
Nodes (7): ../../../../../domain/models/lift_type.dart, customName, id, type, LiftType, WeightUnit, TextColumn get

### Community 53 - "Settings & Wilks/DOTS Tests"
Cohesion: 0.22
Nodes (7): package:powerlifting_tracker/data/repositories/settings_repository.dart, package:powerlifting_tracker/domain/models/sex.dart, package:powerlifting_tracker/domain/use_cases/calculators/wilks_dots_math.dart, db, main, repository, main

### Community 54 - "Calculators Screen Tests"
Cohesion: 0.22
Nodes (8): package:powerlifting_tracker/ui/features/calculators/views/calculators_screen.dart, _flushDriftCleanup, main, pump, pumpAndSettle, _pumpScreen, pumpWidget, _usePhoneSurface

### Community 55 - "Flutter Animation Skill References"
Cohesion: 0.39
Nodes (8): Curves Reference, Explicit Animations Reference, Hero Animations Reference, Implicit Animations Reference, Physics-Based Animations Reference, Staggered Animations Reference, flutter-animations Skill, Literal Motion Principle

### Community 56 - "Database Provider & FormatWeight"
Cohesion: 0.25
Nodes (6): database.dart, databaseProvider, db, formatWeight, value, return

### Community 57 - "Log Screen Tests"
Cohesion: 0.25
Nodes (7): package:powerlifting_tracker/ui/features/log/views/log_screen.dart, _enterWeightAndReps, main, _numpadKey, pump, tap, _usePhoneSurface

### Community 58 - "App Typography & Design Reviewer Agent"
Cohesion: 0.29
Nodes (6): design-system-reviewer Agent, AppTypography, numeric, oswald, textTheme, package:google_fonts/google_fonts.dart

### Community 59 - "Responsive Content Widget"
Cohesion: 0.29
Nodes (6): ../adaptive_breakpoints.dart, build, child, maxWidth, ResponsiveContent, Widget

### Community 60 - "Drift Table Definitions"
Cohesion: 0.53
Nodes (6): @DataClassName, AppSettings, Lifts, Sessions, SetEntries, Table

### Community 61 - "App Theme Builder"
Cohesion: 0.33
Nodes (5): app_colors.dart, app_theme_tokens.dart, app_typography.dart, AppTheme, _build

### Community 62 - "SessionedSet Model"
Cohesion: 0.33
Nodes (5): DateTime, entry, lift, sessionDate, SessionedSet

### Community 63 - "Sessions Table Columns"
Cohesion: 0.33
Nodes (5): DateTimeColumn get, IntColumn get, date, id, package:drift/drift.dart

### Community 64 - "One Rep Max Table Use Case"
Cohesion: 0.33
Nodes (5): estimateOneRepMax, kMinChartRpe, kRpePercentTable, percent, row

### Community 65 - "History View Models"
Cohesion: 0.40
Nodes (4): ../../../../../data/repositories/log_repository_provider.dart, ../../../../../domain/models/sessioned_set.dart, allSetsProvider, watch

### Community 66 - "App Preview Theme Helpers"
Cohesion: 0.40
Nodes (4): _theme, transform, package:flutter/widget_previews.dart, theme/app_theme.dart

### Community 67 - "Misc Animation/Test Fragment"
Cohesion: 0.50
Nodes (4): build, build, MaterialPageRoute, main

### Community 68 - "Dart Testing Skills"
Cohesion: 0.67
Nodes (3): dart-add-unit-test Skill, dart-generate-test-mocks Skill, flutter-add-widget-test Skill

### Community 71 - "Windows CMake Build Chain"
Cohesion: 1.00
Nodes (3): Windows Top-level CMake Project Config, Windows Flutter Library Build Rules, Windows Runner Executable Target

## Knowledge Gaps
- **533 isolated node(s):** `_controller`, `_animation`, `child`, `_opacityTween`, `_sizeTween` (+528 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `AppThemeTokens` connect `Theme Tokens & Hard Rule Widget` to `Log Screen Feature`, `Calculators & History Screen State`, `Domain Models & Set Display Widgets`, `Rest Timer Controller`, `One Rep Max Calculator Tab`, `Session Row Widget`, `Numeric Stepper Widget`, `History Screen`, `Calculators Screen Shell`, `App Theme Tokens`, `Segmented Control Widget`, `Session Detail Screen`, `Hard Nav Rail Widget`, `Hard Nav Bar Widget`, `Wilks/DOTS Calculator Tab`, `Hard Button Widget`, `Rest Timer Overlay Widget`, `History Chart Widget`, `Numpad Widget`?**
  _High betweenness centrality (0.048) - this node is a cross-community bridge._
- **Why does `AppDatabase` connect `Log Repository` to `Drift Database Layer`, `History & Log Repository Tests`, `Settings & Wilks/DOTS Tests`, `Database Provider & FormatWeight`, `Settings Repository`?**
  _High betweenness centrality (0.022) - this node is a cross-community bridge._
- **Why does `AppPreview` connect `Widget Preview Gallery` to `App Preview Theme Helpers`, `Three Lights Indicator Widget`, `Calculators & History Screen State`, `Rest Timer Overlay Widget`, `Domain Models & Set Display Widgets`, `Plate Bar Visual Widget`, `RPE Selector Widget`, `Theme Tokens & Hard Rule Widget`, `One Rep Max Calculator Tab`, `Calculators Screen Shell`, `Hard Nav Rail Widget`?**
  _High betweenness centrality (0.020) - this node is a cross-community bridge._
- **What connects `_controller`, `_animation`, `child` to the rest of the system?**
  _533 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Drift Database Layer` be split into smaller, more focused modules?**
  _Cohesion score 0.02531645569620253 - nodes in this community are weakly interconnected._
- **Should `Windows Flutter Embedding Runtime` be split into smaller, more focused modules?**
  _Cohesion score 0.05837173579109063 - nodes in this community are weakly interconnected._
- **Should `Project Documentation & Specs` be split into smaller, more focused modules?**
  _Cohesion score 0.06363636363636363 - nodes in this community are weakly interconnected._