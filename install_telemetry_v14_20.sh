#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

LOGDIR="$HOME/.cmdbridge/logs"
PERSISTDIR="$HOME/.cmdbridge/.persist"
mkdir -p "$LOGDIR" "$PERSISTDIR"

telemetry_report() {
  TIMESTAMP=$(date --utc +%FT%TZ)
  LOGFILE="$LOGDIR/telemetry_${TIMESTAMP}.json"
  LAST_PERSIST="$PERSISTDIR/telemetry_last.json.gz"

  # Compose telemetry JSON payload
  payload=$(cat <<EOP
{
  "timestamp": "$TIMESTAMP",
  "host": "$(hostname)",
  "user": "$(whoami)",
  "cpu_load_percent": $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'),
  "mem_used_percent": $(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }'),
  "disk_io_kbps": $(iostat -d 1 2 | tail -n 3 | head -n 1 | awk '{print $3}'),
  "git_commit": "$(git -C ~/cmdbridge rev-parse HEAD || echo "none")",
  "status": "OK"
}
EOP
)

  echo "$payload" > "$LOGFILE"

  # Compress payload
  gzip -f "$LOGFILE"

  # GPG sign compressed payload (assumes default key present)
  gpg --armor --detach-sign "$LOGFILE.gz"

  # Save compressed payload to persistence directory (overwrite last snapshot)
  cp -f "$LOGFILE.gz" "$LAST_PERSIST"
}

send_telemetry() {
  # Stub: simulate 50% success rate
  if (( RANDOM % 2 )); then
    return 0
  else
    return 1
  fi
}

retry_send() {
  local retries=5
  local delay=2
  for ((i=1; i<=retries; i++)); do
    if send_telemetry; then
      echo "[+] Telemetry sent successfully on attempt $i"
      return 0
    else
      echo "[!] Telemetry send failed on attempt $i, retrying in $delay seconds..."
      sleep $delay
      (( delay *= 2 ))
    fi
  done
  echo "[!] Telemetry send failed after $retries attempts"
  return 1
}

# Run telemetry report and retry send
telemetry_report
retry_send
