#!/data/data/com.termux/files/usr/bin/bash
# install_095 - inetutils

set -e

echo "[+] Installing: inetutils"
pkg update -y
pkg install -y inetutils
