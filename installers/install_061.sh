#!/data/data/com.termux/files/usr/bin/bash
# install_061 - clang

set -e

echo "[+] Installing: clang"
pkg update -y
pkg install -y clang
