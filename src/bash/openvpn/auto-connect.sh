#!/bin/bash
export OPEN_VPN_DIR=
export OVPN_FILE_NAME=

cd $OPEN_VPN_DIR 
NUMCON=$(nmcli con show | grep 'tun' | wc -l)
if [ $NUMCON != 1 ]; then 
	echo "$(date) trying to reconnect vpn ..."
	/usr/sbin/openvpn --config $OVPN_FILE_NAME &
	echo "$(date) started."
else
	echo "$(date) vpn-check ok."
fi
