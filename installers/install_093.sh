#!/data/data/com.termux/files/usr/bin/bash
# install_093 - gpg

set -e

echo "[+] Installing: gpg"
pkg update -y
pkg install -y gpg
