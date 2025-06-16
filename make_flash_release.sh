#!/bin/bash
set -e  # Exit if any command fails

# Step 1: Make the release
echo "Creating release..."
./make_release.py

# Step 2: Flash the latest .elf file
echo "Flashing..."
ELF_FILE=$(ls ./release/*-moteus-*.elf | head -n 1)
if [ -z "$ELF_FILE" ]; then
  echo "Error: No ELF file found to flash."
  exit 1
fi

python3 -m moteus.moteus_tool --target 1 --flash "$ELF_FILE"
