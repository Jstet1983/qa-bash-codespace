#!/data/data/com.termux/files/usr/bin/bash
# install_098 - pcre

set -e

echo "[+] Installing: pcre"
pkg update -y
pkg install -y pcre
