#!/data/data/com.termux/files/usr/bin/bash
# install_083 - termux-api

set -e

echo "[+] Installing: termux-api"
pkg update -y
pkg install -y termux-api
