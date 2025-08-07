#!/data/data/com.termux/files/usr/bin/bash
# install_097 - termux-tools

set -e

echo "[+] Installing: termux-tools"
pkg update -y
pkg install -y termux-tools
