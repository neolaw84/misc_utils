#!/bin/bash

pidof XWin > /dev/null
result=$?
if [[ result -ne 0 ]] ; then
	startxwin > /dev/null 2>&1 &	
fi

