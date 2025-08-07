#!/data/data/com.termux/files/usr/bin/bash
# install_057 - coreutils

set -e

echo "[+] Installing: coreutils"
pkg update -y
pkg install -y coreutils
