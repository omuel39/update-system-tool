#!/bin/bash
echo "Updating package..."
sudo apt update
if [ $? -eq 0 ]; then
  echo "Installing tree..."
  sudo apt install -y tree
  echo "Tree version: $(tree --version)"
 else
  echo "update failed!"
fi
