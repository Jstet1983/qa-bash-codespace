#!/data/data/com.termux/files/usr/bin/bash
# install_099 - procps

set -e

echo "[+] Installing: procps"
pkg update -y
pkg install -y procps
