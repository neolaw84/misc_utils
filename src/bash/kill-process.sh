#!/bin/bash

#ps aux -f | grep "$1" | grep -v grep | grep -v $0 

MY_PIDS=$(ps aux -f | grep "$1" | grep -v grep | grep -v $0 | awk '{print $2}')

#echo 'MY_PIDS are ' 
#echo $MY_PIDS

MY_PID_ARR=("$MY_PIDS")

for i in "${MY_PID_ARR[@]}"
do
	echo "killing $i ... "
	kill $i
done
