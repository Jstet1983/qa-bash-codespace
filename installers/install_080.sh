#!/data/data/com.termux/files/usr/bin/bash
# install_080 - cowsay

set -e

echo "[+] Installing: cowsay"
pkg update -y
pkg install -y cowsay
