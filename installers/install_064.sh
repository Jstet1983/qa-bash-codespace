#!/data/data/com.termux/files/usr/bin/bash
# install_064 - nodejs

set -e

echo "[+] Installing: nodejs"
pkg update -y
pkg install -y nodejs
