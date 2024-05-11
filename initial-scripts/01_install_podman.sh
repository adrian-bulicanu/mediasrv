#!/bin/bash

# execute script
# logout + login and check versions:
# podman-compose --version

sudo apt update

sudo apt install -y podman pipx
python3 -m pipx ensurepath
pipx install podman-compose
