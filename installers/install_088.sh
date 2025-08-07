#!/data/data/com.termux/files/usr/bin/bash
# install_088 - libandroid-support

set -e

echo "[+] Installing: libandroid-support"
pkg update -y
pkg install -y libandroid-support
