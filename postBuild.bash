#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it

cd ~
python3 -m venv invoketraining
git clone https://github.com/invoke-ai/invoke-training.git

cd ./invoke-training
$HOME/invoketraining/bin/pip install ".[test]" --extra-index-url https://download.pytorch.org/whl/cu121

# Make target dirs as temporary docker/win patch
sudo mkdir -p /mnt/huggingface/
sudo chown workbench:workbench /mnt/huggingface/

sudo mkdir -p /mnt/invoke/
sudo chown workbench:workbench /mnt/invoke/

sudo mkdir -p /home/workbench/invoke-training/output/
sudo chown workbench:workbench /home/workbench/invoke-training/output/