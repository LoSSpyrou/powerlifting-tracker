---
paths:
  - "lib/**/*.dart"
---

# Design System

This app has a deliberate visual identity. Read this before touching any UI
code, and apply the same system to new screens instead of falling back to
default Material widgets/colors.

## Identity

This is **equipment, not a wellness app**. The audience is powerlifters
logging sets between attempts — often sweaty, chalked, moving fast, under
fatigue. Nothing should read as soft, decorative, or "lifestyle fitness app"
(no pastels, no fully-rounded pill shapes, no generic gradient hero cards).

The visual language is a **competition platform under stage lighting**:
dark graphite surfaces, chalk-white text, and an accent system borrowed
directly from IPF-calibrated competition plate colors rather than a generic
single-brand accent. Every color choice should trace back to something a
powerlifter would actually recognize from a meet or a gym floor.

Full system lives in `lib/ui/core/theme/`:
`app_colors.dart`, `app_typography.dart`, `app_theme.dart`.

## Color system

IPF calibrated plates are color-coded by weight, light to heavy:
5kg white, 10kg green, 15kg yellow, 20kg blue, 25kg red. This progression
is used as `AppColors.rpeColor(rpe)` — an interpolated ramp across RPE 1–10,
since light-to-heavy plates map naturally onto low-to-high perceived effort.

Tokens (`AppColors`):
- `graphite` / `graphiteRaised` — dark theme background / raised surface
- `chalk` — dark theme text (also `plateWhite`, the 5kg plate)
- `steel` / `steelRaised` — light theme background / raised surface
- `ink` — light theme text
- `plateGreen`, `plateYellow`, `plateBlue`, `plateRed` — the rest of the ramp

**Rule learned the hard way:** never use a raw `rpeColor()` (or any ramp
color) directly as freestanding text/foreground color on an arbitrary
surface. The ramp's light end (`plateWhite`/`chalk`) was tuned to pop
against the *dark* theme's graphite background — reused directly as text
on the *light* theme's light-gray surface, RPE 1.0 became nearly invisible.
The fix (see `set_entry_tile.dart`): keep color-coding inside a **bordered
swatch** (a chip or accent bar with an outline, so it stays visible
regardless of the surface it sits on — like a plate's rim), and always
render actual readable text in `theme.colorScheme.onSurface`. The RPE
selector already does this correctly: each chip computes its own text
color from the chip's own background brightness
(`ThemeData.estimateBrightnessForColor`), not the page background.

## Typography

Three roles, via `google_fonts`, assembled in `AppTypography`:
- **Oswald** (condensed, bold) — display text, headers, lift-selector chip
  labels (uppercase, letter-spaced — reads like equipment signage/meet
  scoreboard text). Used with restraint, not for body copy.
- **Inter** — body text, form labels, buttons, anything read at length.
- **JetBrains Mono** (`AppTypography.numeric(...)`) — every logged number:
  weight/reps input fields, the set-history list, RPE chip labels. Tabular
  figures so digits align like a digital scale readout. Any new screen
  that displays a lift number should use this, not the default text style.

## Shape and motion

Minimal border radius (4px) everywhere — buttons, cards, chips, inputs.
Not fully square (that reads as the "broadsheet/hairline" AI-default), not
pill-shaped (too soft for the equipment identity).

Motion is spent in exactly one place per interaction, not scattered.
The existing example: `ThreeLights`
(`ui/features/log/views/widgets/three_lights.dart`)
— the judges' three-light call from competition (white lights = good lift),
flashed once as confirmation when a set logs successfully. If a new screen
wants a moment of motion, it should be similarly literal — tied to something
a lifter would recognize from training or competition — not a generic
fade/slide transition. Respect `MediaQuery.of(context).disableAnimations`.

## Applying this to new screens

History, Calculators, PRs, and Settings are still default-Material
placeholders. When building them out:
1. Pull colors from `AppColors`, never hardcode hex or use `Colors.*`.
2. Pull type styles from `AppTypography` / the themed `TextTheme`.
3. Ask what in *that screen's* content is genuinely sport-specific before
   reaching for decoration — the RPE ramp and three-lights moment both came
   from asking "what does this screen actually represent in the sport,"
   not from a generic design pass. A plate-loading calculator, for
   instance, has an obvious literal visualization (draw the actual plates).
4. Re-check any color used as foreground text/icon against both the light
   and dark theme surface — see the contrast rule above.

## Verification loop

- Run `/verify` before committing UI changes (analyze, test, format).
- For anything touching `lib/ui/features/**` or introducing new colors or
  animations, consider invoking the `design-system-reviewer` subagent to
  check the change against this doc.
- A PostToolUse hook (`.claude/hooks/scripts/design_lint.py`) also prints
  advisory warnings automatically on Edit/Write to `lib/**/*.dart` if it
  spots a raw `Colors.*` or hex-literal color outside the sanctioned
  exceptions.
