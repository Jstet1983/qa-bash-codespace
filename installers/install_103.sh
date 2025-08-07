#!/bin/bash
set -e

echo "[*] Installer running: $(basename "$0")"
echo "[*] Fixing mirrors and installing packages..."

yes | termux-change-repo || echo "[!] Mirror auto-change skipped or failed."
pkg update -y
pkg upgrade -y
pkg install -y curl git gawk coreutils termux-api openssh

echo "[*] Versions:"
echo "  - curl: $(curl --version | head -n1)"
echo "  - gawk: $(gawk --version | head -n1)"
echo "  - git:  $(git --version)"

if [[ -f ~/cmdbridge/start.sh ]]; then
  echo "[*] Found start.sh — launching..."
  bash ~/cmdbridge/start.sh
else
  echo "[!] No start.sh found in ~/cmdbridge/"
fi
