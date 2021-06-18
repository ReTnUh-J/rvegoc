#!/bin/bash
# Script for update RVEGOC tools

git clone --depth=1 https://github.com/ReTnUh-J/rvegoc.git
sudo chmod +x rvegoc/install.sh
bash rvegoc/install.sh