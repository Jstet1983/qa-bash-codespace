#!/data/data/com.termux/files/usr/bin/bash
# install_076 - htop

set -e

echo "[+] Installing: htop"
pkg update -y
pkg install -y htop
