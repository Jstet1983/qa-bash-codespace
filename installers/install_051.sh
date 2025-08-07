#!/data/data/com.termux/files/usr/bin/bash
# install_051 - wget

set -e

echo "[+] Installing: wget"
pkg update -y
pkg install -y wget
