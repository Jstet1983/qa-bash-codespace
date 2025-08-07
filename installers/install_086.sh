#!/data/data/com.termux/files/usr/bin/bash
# install_086 - unstable-repo

set -e

echo "[+] Installing: unstable-repo"
pkg update -y
pkg install -y unstable-repo
