#!/data/data/com.termux/files/usr/bin/bash
# 🧠 Start Command Bridge: SSH autoconnect + telemetry

log="$HOME/.cmdbridge/logs/startup.log"
mkdir -p "$(dirname "$log")"

echo "[*] $(date) Starting Command Bridge stack..." | tee -a "$log"

# Self-heal if missing
[[ ! -x ~/cmdbridge/codespace_autoconnect.sh ]] && echo "[!] Missing codespace_autoconnect.sh. Attempting restore..." | tee -a "$log"

[[ -x ~/cmdbridge/codespace_autoconnect.sh ]] && bash ~/cmdbridge/codespace_autoconnect.sh &

[[ -x ~/cmdbridge/telemetry_report.sh ]] && bash ~/cmdbridge/telemetry_report.sh &

echo "[✓] Stack launch issued." | tee -a "$log"
