#!/data/data/com.termux/files/usr/bin/bash
# regenerate_installers.sh - clean regenerate missing install scripts

PACKAGES=(curl git tar wget nano neovim jq unzip zip coreutils dnsutils busybox net-tools clang make python nodejs tsu proot openssh zsh tmux vim grep sed awk less rsync htop tree figlet toilet cowsay openssl cmatrix termux-api root-repo x11-repo unstable-repo libandroid-glob libandroid-support libcurl termux-exec libutil fakeroot gpg gawk inetutils netcat termux-tools pcre procps termux-elf-cleaner termux-services clang cmake libxml2 libxslt file gdb ltrace strace bats ncurses tsudo)

mkdir -p ~/cmdbridge/installers

iter=48
for pkg in "${PACKAGES[@]}"; do
  fname=~/cmdbridge/installers/install_$(printf '%03d' $iter).sh
  cat > "$fname" <<EOINSTALL
#!/data/data/com.termux/files/usr/bin/bash
# install_$(printf '%03d' $iter) - $pkg

set -e

echo "[+] Installing: $pkg"
pkg update -y
pkg install -y $pkg
EOINSTALL
  chmod +x "$fname"
  echo "[+] Generated $fname"
  iter=$((iter+1))
  if [ $iter -gt 100 ]; then
    break
  fi
done
