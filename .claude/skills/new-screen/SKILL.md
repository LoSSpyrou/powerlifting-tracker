---
name: new-screen
description: Build out a new top-level screen (or flesh out one of the History/Calculators/PRs/Settings placeholders) consistent with the app's design system, and wire it into navigation. Use when starting work on a new or placeholder screen.
argument-hint: "[screen name]"
---

# New Screen

## Task

Build out `$ARGUMENTS` (or the target screen) consistent with
`.claude/rules/design-system.md`, and wire it into the app's navigation.

## Instructions

1. Ask what in *this screen's* content is genuinely sport-specific before
   reaching for decoration. The RPE ramp and `ThreeLights` both came from
   asking "what does this screen actually represent in the sport," not
   from a generic design pass — a plate-loading calculator, for instance,
   has an obvious literal visualization: draw the actual plates.
2. Build the widget under `lib/ui/features/<feature>/views/` (with a
   feature-local `widgets/` subfolder for anything not shared with another
   feature; cross-feature widgets belong in `lib/ui/core/widgets/`
   instead):
   - Colors from `AppColors` only — never hardcode hex or use `Colors.*`.
   - Type styles from `AppTypography` / the themed `TextTheme`.
   - ~4px border radius throughout (not square, not pill-shaped).
3. Wire it into navigation. **This repo has no named-route table.**
   `lib/ui/app.dart`'s `_RootShell` holds a static `_screens` list
   rendered via `IndexedStack`, plus a single `_destinations` list of
   `(icon, label)` pairs that's mapped to both a `NavigationRail` (wide
   windows) and a `NavigationBar` (narrow windows) via `LayoutBuilder`. Add
   the new screen widget to `_screens` and a matching `_Destination` entry
   at the same index — both lists must stay in sync by position.
4. Re-check every color used as foreground text/icon against **both** the
   light and dark theme surfaces — see the contrast rule in
   `.claude/rules/design-system.md`. Ramp colors go inside a bordered
   swatch or use a brightness-computed text color, never as a freestanding
   foreground color.
5. Run `/verify`, and consider invoking the `design-system-reviewer`
   subagent before considering the screen done.

## Rules

- Never introduce a new color outside `AppColors`.
- Never use `Colors.*` directly except the two sanctioned patterns
  documented in `.claude/rules/design-system.md`.
- Keep `_screens` and the `NavigationBar` destinations list in sync — an
  index mismatch silently shows the wrong icon/label for a screen.
