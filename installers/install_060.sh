#!/data/data/com.termux/files/usr/bin/bash
# install_060 - net-tools

set -e

echo "[+] Installing: net-tools"
pkg update -y
pkg install -y net-tools
