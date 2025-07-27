#!/bin/bash
# ✅ Command Bridge — Git + SSH Identity Bootstrap

set -e

IDENTITY_NAME="Jeffery Andrew Stettler"
IDENTITY_EMAIL="stettlerjeff@gmail.com"
SSH_KEY="$HOME/.ssh/id_ed25519"
SSH_CONFIG="$HOME/.ssh/config"

echo "[🔧] Setting Git identity: $IDENTITY_NAME <$IDENTITY_EMAIL>"
git config --global user.name "$IDENTITY_NAME"
git config --global user.email "$IDENTITY_EMAIL"

echo "[📁] Ensuring ~/.ssh exists..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [[ ! -f "$SSH_KEY" ]]; then
    echo "[🔐] SSH key not found. Generating..."
    ssh-keygen -t ed25519 -C "$IDENTITY_EMAIL" -f "$SSH_KEY" -N ""
else
    echo "[✅] SSH key already exists."
fi

echo "[⚙️] Writing SSH config..."
cat << 'EOS' > "$SSH_CONFIG"
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
EOS

echo "[🔒] Fixing permissions..."
chown $(whoami):$(whoami) "$SSH_CONFIG"
chmod 600 "$SSH_CONFIG"
chmod 600 "$SSH_KEY"
chmod 644 "$SSH_KEY.pub"

echo "[🧪] Testing GitHub SSH authentication..."
ssh -T git@github.com || echo "[⚠️] SSH auth to GitHub failed. Add key at: https://github.com/settings/ssh/new"

echo -e "\n[📎] Public key for GitHub:"
cat "$SSH_KEY.pub"

echo -e "\n[🌐] Testing curl to GitHub..."
if curl -s --head https://github.com | grep "200 OK" > /dev/null; then
    echo "[✅] Internet connectivity confirmed."
else
    echo "[❌] No internet detected. Check DNS or firewall."
fi

echo "[✅] Bootstrap complete."
