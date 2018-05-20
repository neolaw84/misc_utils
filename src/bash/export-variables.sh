#!/bin/bash

# for docker client to connect to a custom host
export DOCKER_HOST=192.168.99.100

# for X11 server
export DISPLAY=:0.0

# for anaconda
export CONDA_BASE_DIR=/cygdrive/c/ProgramData/Anaconda3
export CONDA_ENV_BASE_DIR=/c/Users/edward/AppData/Local/conda/conda

# for openvpn auto-connect, set it directly in the script
# as in some system, you run it as root/su/sudo
#export OPEN_VPN_DIR=/home/edward/openvpn/
#export OVPN_FILE_NAME=client.ovpn
