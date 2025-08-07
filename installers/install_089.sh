#!/data/data/com.termux/files/usr/bin/bash
# install_089 - libcurl

set -e

echo "[+] Installing: libcurl"
pkg update -y
pkg install -y libcurl
