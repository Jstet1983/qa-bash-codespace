#!/bin/bash
# Launcher to run latest installer script
LATEST=$(ls -1 ~/cmdbridge/installers | grep install_ | sort | tail -n 1)
bash "$HOME/cmdbridge/installers/$LATEST"
