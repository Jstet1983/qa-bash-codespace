#!/data/data/com.termux/files/usr/bin/bash
# install_075 - rsync

set -e

echo "[+] Installing: rsync"
pkg update -y
pkg install -y rsync
