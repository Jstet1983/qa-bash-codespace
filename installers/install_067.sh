#!/data/data/com.termux/files/usr/bin/bash
# install_067 - openssh

set -e

echo "[+] Installing: openssh"
pkg update -y
pkg install -y openssh
