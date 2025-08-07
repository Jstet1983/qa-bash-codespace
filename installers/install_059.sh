#!/data/data/com.termux/files/usr/bin/bash
# install_059 - busybox

set -e

echo "[+] Installing: busybox"
pkg update -y
pkg install -y busybox
