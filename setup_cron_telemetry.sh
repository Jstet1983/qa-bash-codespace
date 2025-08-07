#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Installing cronie (cron daemon)..."
pkg install -y cronie

echo "[*] Starting cron service..."
pgrep crond && pkill crond || true
crond

echo "[*] Setting up crontab for telemetry reporting..."

CRON_JOB="0 * * * * bash $HOME/cmdbridge/telemetry_report.sh"

# Write current cron jobs to temp file or empty if none
crontab -l 2>/dev/null > cron_bkp || true

# Add job if not already present
grep -Fxq "$CRON_JOB" cron_bkp || echo "$CRON_JOB" >> cron_bkp

crontab cron_bkp
rm cron_bkp

echo "[✓] Cron job installed: $CRON_JOB"

echo "[*] Verifying crontab..."
crontab -l
