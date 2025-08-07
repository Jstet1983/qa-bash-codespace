#!/data/data/com.termux/files/usr/bin/bash
set -e

# Config
GITHUB_REPO="git@github.com:Jstet1983/qa-bash-codespace.git"
WORKDIR="$HOME/cmdbridge"
INSTALLERS_DIR="$WORKDIR/installers"

# Package list (53 packages)
PACKAGES=(curl git tar wget nano neovim jq unzip zip coreutils dnsutils busybox net-tools clang make python nodejs tsu proot openssh zsh tmux vim grep sed awk less rsync htop tree figlet toilet cowsay openssl cmatrix termux-api root-repo x11-repo unstable-repo libandroid-glob libandroid-support libcurl termux-exec libutil fakeroot gpg gawk inetutils netcat termux-tools pcre procps termux-elf-cleaner termux-services clang cmake libxml2 libxslt file gdb ltrace strace bats ncurses tsudo)

mkdir -p "$INSTALLERS_DIR"

echo "[*] Generating installer scripts..."
iter=48
for pkg in "${PACKAGES[@]}"; do
  fname="$INSTALLERS_DIR/install_$(printf '%03d' $iter).sh"
  cat > "$fname" <<EOF2
#!/data/data/com.termux/files/usr/bin/bash
# install_$(printf '%03d' $iter) - $pkg

set -e

echo "[+] Installing: $pkg"
pkg update -y
pkg install -y $pkg
EOF2
  chmod +x "$fname"
  echo "[+] Generated $fname"
  iter=$((iter+1))
  if (( iter > 100 )); then
    break
  fi
done

cd "$WORKDIR"

if [ ! -d ".git" ]; then
  echo "[*] Initializing git repository..."
  git init
  git remote add origin "$GITHUB_REPO"
else
  echo "[*] Git repository detected."
fi

echo "[*] Adding files to git..."
git add installers/
git add *.sh || true
git add .gitignore || true

echo "[*] Committing changes..."
git commit -m "Auto-generated installers 048-100 and pushed via regen_push_install.sh" || echo "[!] Nothing to commit."

echo "[*] Pushing to GitHub..."
git push -u origin main

# Optional: Run installers sequentially (comment out if not desired)
# echo "[*] Running installers..."
# for ((i=48; i<=100; i++)); do
#   bash "$INSTALLERS_DIR/install_$(printf '%03d' $i).sh"
# done

echo "[✓] Complete."
