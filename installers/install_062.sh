#!/data/data/com.termux/files/usr/bin/bash
# install_062 - make

set -e

echo "[+] Installing: make"
pkg update -y
pkg install -y make
