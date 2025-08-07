#!/data/data/com.termux/files/usr/bin/bash
# install_065 - tsu

set -e

echo "[+] Installing: tsu"
pkg update -y
pkg install -y tsu
