#!/data/data/com.termux/files/usr/bin/bash
# install_077 - tree

set -e

echo "[+] Installing: tree"
pkg update -y
pkg install -y tree
