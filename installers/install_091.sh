#!/data/data/com.termux/files/usr/bin/bash
# install_091 - libutil

set -e

echo "[+] Installing: libutil"
pkg update -y
pkg install -y libutil
