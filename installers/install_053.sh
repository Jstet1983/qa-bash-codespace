#!/data/data/com.termux/files/usr/bin/bash
# install_053 - neovim

set -e

echo "[+] Installing: neovim"
pkg update -y
pkg install -y neovim
