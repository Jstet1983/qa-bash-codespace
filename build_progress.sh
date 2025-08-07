#!/data/data/com.termux/files/usr/bin/bash

TOTAL=100
BAR_WIDTH=50

update_bar() {
  local PROGRESS=$1
  local FILLED=$(( PROGRESS * BAR_WIDTH / TOTAL ))
  local EMPTY=$(( BAR_WIDTH - FILLED ))

  local FILLED_BAR=$(printf "%0.s█" $(seq 1 $FILLED))
  local EMPTY_BAR=$(printf "%0.s▒" $(seq 1 $EMPTY))

  printf "\rProgress: [${FILLED_BAR}${EMPTY_BAR}] %3d%% (%d/%d)" "$(( PROGRESS * 100 / TOTAL ))" "$PROGRESS" "$TOTAL"
}

echo "Mistral Command Bridge: Build Pipeline Tracker"
for i in $(seq 1 $TOTAL); do
  sleep 0.1 # simulate work
  update_bar $i
done

echo -e "\n✅ Done. All $TOTAL iterations completed."
