#!/bin/bash
OUT="$HOME/cmdbridge/audit/install_audit_$(date +%F_%H-%M-%S)"
mkdir -p "$OUT"

echo "[*] Saving pkg list..."
pkg list-installed > "$OUT/termux_packages.txt"

echo "[*] Saving Python packages..."
pip list > "$OUT/python_packages.txt" 2>/dev/null || echo "pip not found"

echo "[*] Saving directory tree..."
tree $HOME/cmdbridge > "$OUT/dir_tree.txt"

echo "[✓] Snapshot complete: $OUT"
