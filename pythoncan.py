#!/usr/bin/env python3
"""Compatibility entry point for the SocketCAN to MQTT utility."""
from pathlib import Path
import runpy

runpy.run_path(str(Path(__file__).parent / "tools" / "pythoncan.py"), run_name="__main__")
