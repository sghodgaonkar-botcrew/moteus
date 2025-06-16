#!/bin/bash
set -e  # Exit on any error

# Ensure release directory exists and is writable
mkdir -p release
chmod u+w release

# Step 1: Create release
echo "Creating release..."
./make_release.py

# Step 2: Pick the latest .elf file
ELF_FILE=$(ls -t ./release/*-moteus-*.elf | head -n 1)
if [ -z "$ELF_FILE" ]; then
  echo "Error: No ELF file found in release/ directory."
  exit 1
fi

echo "Found ELF file to flash: $ELF_FILE"

# Step 3: Prompt and flash
# read -p "Ready to flash $ELF_FILE to target 1. Press Enter to continue..."
python3 -m moteus.moteus_tool --target 1 --flash "$ELF_FILE"
