#!/data/data/com.termux/files/usr/bin/bash
# install_092 - fakeroot

set -e

echo "[+] Installing: fakeroot"
pkg update -y
pkg install -y fakeroot
