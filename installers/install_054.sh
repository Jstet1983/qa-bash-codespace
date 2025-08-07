#!/data/data/com.termux/files/usr/bin/bash
# install_054 - jq

set -e

echo "[+] Installing: jq"
pkg update -y
pkg install -y jq
