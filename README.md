# misc_utils
Miscellanous scripts and code-fragments that I use.

This set-up is for a Windows 7 and above using babun-based
cygwin setup. 

# Preparations

Before starting, install the followings: 

1. babun -- http://babun.github.io/
2. anaconda (optional) -- https://anaconda.org/
3. docker toolbox or docker for windows (optional) -- https://www.docker.com/
4. babun-docker -- https://github.com/tiangolo/babun-docker
4. tmux -- pact install tmux
5. x11 server -- pact install x11-server xinit
6. run-git-agent (stolen from elsewhere) 

# How to use

First, git clone it. 

Secondly, for tmux, put .tmux.conf in ~/
 
For the rest (non-tmux), source the following in this order at the end of '.zshrc'.

1. export-variables.sh
2. auto-start-xwin.sh
3. cyg-conda.sh

Finally, disable/enable exports and/or scripts as desired.

For openvpn auto-connection, follow the instructions below:

1. modify the OPEN_VPN_DIR and OVPN_FILE_NAME in openvpn/auto-connect.sh. 
Don't forget to use complete path (because crontab)
2. please the .ovpn file you download in the openvpn directory
3. put username/password in openvpn/pass.txt
4. add the content of to-add-to-ovpn-file.txt to .ovpn file (before the
'# NOTE: LZO commands ... -----BEGIN CERTIFICATE-----')
5. create a crontab entry with openvpn/auto-connect.sh (good to redirect
and append output to a log file for review).  

For ubuntu, copy the override.conf to /etc/systemd/system/apt-daily.timer.d/override.conf

# Additional Misc Utilities

1. mv_file_in_list.sh

Script "mv_file_in_list.sh" reads a (text) file containing paths (absolute or relative) 
of files and move them to the destination directory (maintaining the path structure). 

Usage: ./mv_file_in_list.sh <list_file_path> <destination_dir>

For example, if my_list_file.txt contains:

/home/user/my_file_with_absolute_path.txt
my_file_with_relative_path.txt
my/second/file/with_relative_path.txt

The invocation: ./mv_file_in_list.sh my_list_file.txt dest/

will move these files to: 

dest/home/user/my_file_with_absolute_path.txt,
dest/my_file_with_relative_path.txt and
dest/my/second/file/with_relative_path.txt


