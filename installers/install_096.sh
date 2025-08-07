#!/data/data/com.termux/files/usr/bin/bash
# install_096 - netcat

set -e

echo "[+] Installing: netcat"
pkg update -y
pkg install -y netcat
