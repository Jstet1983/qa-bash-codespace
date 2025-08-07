#!/data/data/com.termux/files/usr/bin/bash
# install_069 - tmux

set -e

echo "[+] Installing: tmux"
pkg update -y
pkg install -y tmux
