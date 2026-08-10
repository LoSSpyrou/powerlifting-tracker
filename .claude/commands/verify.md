---
description: Run the pre-commit verification gate (flutter analyze, flutter test, dart format check) and report a pass/fail summary.
allowed-tools: Bash(flutter analyze:*), Bash(flutter test:*), Bash(dart format:*)
argument-hint: "[--fix]"
---

Run the pre-commit verification gate. Do not skip stages, and only the
format stage may write files (and only under `--fix`) — never auto-fix
analyzer or test failures.

## Stage 1: Static analysis

Run `flutter analyze`. If it reports any errors (not just info-level
lints), stop here and report the failure — do not proceed to Stage 2.

## Stage 2: Tests

Run `flutter test`. Report the pass/fail counts and the name of every
failing test.

## Stage 3: Format

If `$ARGUMENTS` contains `--fix`, run `dart format .` (write mode) first.
Otherwise, run `dart format --set-exit-if-changed .`. On failure, list the
files that would be reformatted and point at `dart format .` or
`/verify --fix` rather than reformatting automatically.

## Summary

Report a per-stage PASS/FAIL table, then one verdict line:
- "All checks passed — safe to commit." if all three stages passed.
- "N stage(s) failed — do not commit yet." otherwise, naming the failed
  stages.
