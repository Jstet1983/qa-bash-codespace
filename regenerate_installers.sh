#!/bin/bash
set -e

INSTALLER_DIR="$HOME/cmdbridge/installers"
mkdir -p "$INSTALLER_DIR"

LAST_NUM=$(ls "$INSTALLER_DIR" 2>/dev/null | grep -Eo 'install_[0-9]{3}\.sh' | sed -E 's/install_([0-9]+)\.sh/\1/' | sort -n | tail -n 1)
LAST_NUM=${LAST_NUM:-0}
NEXT_NUM=$(printf "%03d" $((10#$LAST_NUM + 1)))
SCRIPT="$INSTALLER_DIR/install_${NEXT_NUM}.sh"

echo "[*] Generating installer: $SCRIPT"

cat > "$SCRIPT" << 'INNER'
#!/bin/bash
set -e

echo "[*] Installer running: $(basename "$0")"
echo "[*] Fixing mirrors and installing packages..."

yes | termux-change-repo || echo "[!] Mirror auto-change skipped or failed."
pkg update -y
pkg upgrade -y
pkg install -y curl git gawk coreutils termux-api openssh

echo "[*] Versions:"
echo "  - curl: $(curl --version | head -n1)"
echo "  - gawk: $(gawk --version | head -n1)"
echo "  - git:  $(git --version)"

if [[ -f ~/cmdbridge/start.sh ]]; then
  echo "[*] Found start.sh — launching..."
  bash ~/cmdbridge/start.sh
else
  echo "[!] No start.sh found in ~/cmdbridge/"
fi
INNER

chmod +x "$SCRIPT"
echo "[+] Created: $SCRIPT"

if [ -d "$HOME/cmdbridge/.git" ]; then
  cd "$HOME/cmdbridge"
  git add "$SCRIPT"
  git commit -m "Auto-generated: $SCRIPT"
  git push origin main
else
  echo "[!] Git repo not initialized or remote not set."
fi
