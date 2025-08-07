#!/data/data/com.termux/files/usr/bin/bash
# install_052 - nano

set -e

echo "[+] Installing: nano"
pkg update -y
pkg install -y nano
