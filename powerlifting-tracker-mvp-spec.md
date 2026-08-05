# Powerlifting Tracker — MVP Spec

## 1. Positioning
A lift-logging app built *only* for powerlifters — squat, bench, deadlift. No calorie counting, no cardio, no generic "workout" bloat. If it's not useful for someone training for or tracking progress toward a meet, it's not in v1.

**One-line pitch:** "The only lift tracker that speaks powerlifting — RPE, Wilks, and meet prep, nothing else."

---

## 2. MVP feature set (v1 — ship this, nothing more)

### Must-have
1. **Log a lift** — exercise (squat/bench/deadlift, +custom accessory lifts), weight, reps, RPE (1–10, 0.5 increments), date. 3 taps max to log a set.
2. **Plate-loading calculator** — enter target weight + bar weight + available plates → shows plates per side. Standalone screen, no login needed. (This alone drives organic search traffic — "plate calculator" is a high-intent search term.)
3. **1RM estimator** — Epley or Brzycki formula from any logged set, auto-shown after logging.
4. **Wilks / DOTS score calculator** — enter bodyweight + total (or auto-pull from logged PRs) → score. Useful standalone even for non-regular-users, another organic search magnet.
5. **Lift history** — simple list/chart per lift over time (weight × reps, filterable by exercise).
6. **PR tracker** — auto-detects and highlights new personal records per rep range (1RM, 3RM, 5RM etc.)

### Nice-to-have (v1.1, after initial validation — don't build yet)
- Meet-day countdown + basic taper week template
- Training block/program templates (5/3/1, Sheiko-lite, etc.)
- Bodyweight tracking alongside lifts
- Export data (CSV)
- Apple Health / Google Fit sync

### Explicitly out of scope for v1
- Social features, feeds, friends
- Video form-check
- Nutrition/macro tracking
- Non-powerlifting exercises beyond a small accessory list

---

## 3. Data model (simple by design)

```
User (local-first, no login required for v1)
  - id
  - bodyweight_unit (kg/lb)

Lift (enum): squat, bench, deadlift, custom
  - id
  - name (for custom lifts)

Session
  - id
  - date

SetEntry
  - id
  - session_id (FK)
  - lift_id (FK)
  - weight
  - reps
  - rpe (nullable)
  - unit (kg/lb)
  - created_at

BodyweightEntry (v1.1)
  - id
  - date
  - weight
```

Keep it local-first (SQLite via `sqflite` or `drift` in Flutter) for v1 — no backend needed, which means no server cost and no auth friction. Add optional cloud sync later only if retention data justifies it.

---

## 4. Screens (v1)

1. **Log** (home screen) — quick-add set, defaults to last-used lift/weight for speed
2. **History** — per-lift chart + table, filter by date range
3. **Calculators** — tab with: Plate Loader, 1RM Estimator, Wilks/DOTS (these can be used with zero data entered, good for first-open value)
4. **PRs** — auto-generated leaderboard of your own records
5. **Settings** — units (kg/lb), theme

That's it — 5 screens for v1. Resist scope creep.

---

## 5. Tech stack

- **Flutter** (single codebase → iOS + Android)
- **State management:** Riverpod or Provider (either is fine, pick what you're fastest in)
- **Local DB:** `drift` (SQLite wrapper, type-safe) or `sqflite` if you want less setup overhead
- **Charts:** `fl_chart` package
- **Ads:** Google AdMob via `google_mobile_ads` package
  - Banner ad on History/Calculators screens
  - Interstitial (not on Log screen — don't interrupt logging flow, that kills retention)
- **IAP:** `in_app_purchase` package for "Remove Ads" one-time purchase + optional "Pro" tier later

---

## 6. Monetization plan

| Tier | What's included | Price |
|---|---|---|
| Free | All logging, calculators, history, PRs — with banner + occasional interstitial ads | $0 |
| Remove Ads | Same features, no ads | $3.99 one-time |
| Pro (v1.1+, once programming templates exist) | + training templates, meet prep, cloud sync | $2.99/mo or $19.99/yr |

Don't gate core logging behind a paywall — that kills the daily-use habit that makes the app sticky and ad revenue meaningful. Gate *convenience and advanced features* instead.

---

## 7. Build order (suggested sequence)

1. Data model + local DB setup
2. Log screen (core loop) — get this working end-to-end first, even ugly
3. Calculators tab (plate loader, 1RM, Wilks) — these are standalone and don't depend on logged data, fast wins
4. History screen + charts
5. PR detection logic
6. AdMob integration
7. Polish pass (empty states, onboarding, app icon, store screenshots)
8. TestFlight / internal testing track — dogfood it yourself for 1-2 weeks of real training
9. Store listing (ASO: target "powerlifting tracker," "plate calculator," "wilks calculator," "1rm calculator" as keywords)
10. Submit to both stores

**Rough estimate for an experienced dev:** steps 1–6 in 1–2 weeks of part-time work; steps 7–10 another few days to a week including store review wait time.

---

## 8. Validation checklist before/after launch

- [ ] Search "powerlifting tracker" and "plate calculator" in App Store/Play Store — note top 5 competitors and their 1-3 star review complaints
- [ ] Check r/powerlifting and r/formcheck for recurring app complaints or feature requests
- [ ] After launch: track Day-1 and Day-7 retention (this matters more than downloads early on)
- [ ] Track which screen users hit first (calculators vs. log) — tells you if standalone-calculator traffic is a real acquisition channel worth optimizing for
