#!/data/data/com.termux/files/usr/bin/bash
# install_090 - termux-exec

set -e

echo "[+] Installing: termux-exec"
pkg update -y
pkg install -y termux-exec
