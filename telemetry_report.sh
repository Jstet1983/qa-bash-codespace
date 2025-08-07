#!/data/data/com.termux/files/usr/bin/bash
# 📡 Telemetry heartbeat logger: packages + status + uptime

log="$HOME/.cmdbridge/logs/telemetry_$(date +%Y%m%d_%H%M%S).log"
mkdir -p "$(dirname "$log")"

echo "[*] $(date) Telemetry Start" | tee -a "$log"

# ✅ System Info
uptime | tee -a "$log"
termux-info | tee -a "$log"

# ✅ Package Logs
echo "[*] Python packages:" | tee -a "$log"
pip list 2>/dev/null | tee -a "$log"

echo "[*] APT packages:" | tee -a "$log"
apt list --installed 2>/dev/null | tee -a "$log"

# ✅ Git + SSH check
echo "[*] Git Identity:" | tee -a "$log"
git config --global user.name 2>/dev/null | tee -a "$log"
git config --global user.email 2>/dev/null | tee -a "$log"

echo "[*] SSH Keys:" | tee -a "$log"
ls -l ~/.ssh | tee -a "$log"

echo "[✓] Telemetry Complete" | tee -a "$log"
