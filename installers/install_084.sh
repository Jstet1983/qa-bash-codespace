#!/data/data/com.termux/files/usr/bin/bash
# install_084 - root-repo

set -e

echo "[+] Installing: root-repo"
pkg update -y
pkg install -y root-repo
