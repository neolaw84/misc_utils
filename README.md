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

# How to use

First, git clone it. 

Secondly, for tmux, put .tmux.conf in ~/
 
For the rest (non-tmux), source the following in this order at the end of '.zshrc'.

1. export-variables.sh
2. auto-start-xwin.sh
3. cyg-conda.sh

Finally, disable/enable exports and/or scripts as desired.

 
