#!/data/data/com.termux/files/usr/bin/bash
# install_058 - dnsutils

set -e

echo "[+] Installing: dnsutils"
pkg update -y
pkg install -y dnsutils
