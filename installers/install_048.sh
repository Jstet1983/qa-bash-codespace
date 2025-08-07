#!/data/data/com.termux/files/usr/bin/bash
# install_048 - curl

set -e

echo "[+] Installing: curl"
pkg update -y
pkg install -y curl
