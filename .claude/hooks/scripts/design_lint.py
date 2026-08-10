#!/usr/bin/env python
"""PostToolUse hook: advisory-only design-system lint for Dart UI files.

Fires on Edit/Write. Never blocks -- always exits 0. Flags likely raw
Colors.*/hex-literal usage outside the theme token files and the two
sanctioned exceptions, and points at the design system doc.
"""
import json
import os
import re
import sys
from pathlib import Path

SANCTIONED_EXCEPTIONS = {
    "lib/features/log/widgets/rpe_selector.dart",
    "lib/features/log/widgets/three_lights.dart",
}
THEME_DIR = "lib/shared/theme/"
COLOR_PATTERN = re.compile(r"\bColors\.\w+")
HEX_PATTERN = re.compile(r"0x[0-9A-Fa-f]{6,8}\b")


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except Exception:
        return 0

    if payload.get("tool_name") not in ("Edit", "Write"):
        return 0

    file_path = payload.get("tool_input", {}).get("file_path")
    if not file_path:
        return 0

    project_dir = os.environ.get("CLAUDE_PROJECT_DIR", "")
    try:
        rel_posix = Path(file_path).resolve().relative_to(
            Path(project_dir).resolve()
        ).as_posix()
    except Exception:
        rel_posix = Path(file_path).as_posix()

    if not rel_posix.endswith(".dart") or not rel_posix.startswith("lib/"):
        return 0
    if rel_posix.startswith(THEME_DIR) or rel_posix in SANCTIONED_EXCEPTIONS:
        return 0

    try:
        content = Path(file_path).read_text(encoding="utf-8")
    except Exception:
        return 0

    hits = {m.group(0) for m in COLOR_PATTERN.finditer(content)}
    hits |= {m.group(0) for m in HEX_PATTERN.finditer(content)}

    if hits:
        sample = ", ".join(sorted(hits)[:5])
        print(
            f"[design-lint] {rel_posix}: found {sample} -- this app pulls "
            "colors from AppColors, never Colors.*/hex literals (see "
            ".claude/rules/design-system.md). If this is a legitimate "
            "brightness-computed text color or a Colors.transparent "
            "animation lerp, see rpe_selector.dart / three_lights.dart for "
            "the sanctioned pattern."
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
