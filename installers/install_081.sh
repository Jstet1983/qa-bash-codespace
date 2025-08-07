#!/data/data/com.termux/files/usr/bin/bash
# install_081 - openssl

set -e

echo "[+] Installing: openssl"
pkg update -y
pkg install -y openssl
