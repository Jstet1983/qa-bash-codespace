#!/data/data/com.termux/files/usr/bin/bash
# install_100 - termux-elf-cleaner

set -e

echo "[+] Installing: termux-elf-cleaner"
pkg update -y
pkg install -y termux-elf-cleaner
