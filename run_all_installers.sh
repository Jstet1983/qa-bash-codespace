#!/bin/bash
set -e
LOGFILE="$HOME/cmdbridge/logs/full_install_$(date +%F_%H-%M-%S).log"
echo "[+] Starting full stack installation..." | tee "$LOGFILE"

for script in $(ls -1 ~/cmdbridge/installers/install_*.sh | sort); do
    echo "[*] Running: $script" | tee -a "$LOGFILE"
    bash "$script" >> "$LOGFILE" 2>&1
    echo "[✓] Completed: $script" | tee -a "$LOGFILE"
done

echo "[✓] All installers completed." | tee -a "$LOGFILE"
