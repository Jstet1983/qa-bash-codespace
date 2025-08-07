#!/data/data/com.termux/files/usr/bin/bash
# install_085 - x11-repo

set -e

echo "[+] Installing: x11-repo"
pkg update -y
pkg install -y x11-repo
