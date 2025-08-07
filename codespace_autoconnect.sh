#!/data/data/com.termux/files/usr/bin/bash
# Auto-SSH into GitHub Codespace with telemetry heartbeat

log="$HOME/.cmdbridge/logs/ssh_codespace.log"
mkdir -p "$(dirname "$log")"

echo "[*] $(date) Attempting Codespace SSH..." | tee -a "$log"

CSP=$(gh codespace list --json name -q '.[0].name')

if [ -z "$CSP" ]; then
    echo "[!] No active Codespaces. Exiting." | tee -a "$log"
    exit 1
fi

echo "[+] Connecting to Codespace: $CSP" | tee -a "$log"
gh codespace ssh -c "$CSP"

# Telemetry ping on disconnect
echo "[*] $(date) Codespace disconnected." | tee -a "$log"
bash ~/cmdbridge/telemetry_report.sh &
