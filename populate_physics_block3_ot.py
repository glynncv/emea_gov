"""Launcher — delegates to scripts/populate_physics_block3_ot.py (same CLI)."""
from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

_IMPL = Path(__file__).resolve().parent / "scripts" / "populate_physics_block3_ot.py"
_spec = importlib.util.spec_from_file_location("populate_physics_block3_ot_impl", _IMPL)
if _spec is None or _spec.loader is None:
    raise RuntimeError(f"Cannot load {_IMPL}")
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
sys.exit(_mod.main())
