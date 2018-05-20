#!/bin/bash

# Derived from https://stackoverflow.com/questions/36969824/using-anaconda-environments-with-cygwin-on-windows

###############################################################################

#  Anaconda Environment Selection - Plese set CONDA_BASE_DIR to the directory
#  containing the base installation of anaconda/miniconda.

#export CONDA_BASE_DIR=/cygdrive/c/Users/Patrick/Miniconda3

#  Proxy Servers & Network Setup (if needed)

#export HTTP_PROXY=
#export HTTPS_PROXY=

#  IMPORTANT - Ignore carriage returns when using a Cygwin environment.

#export SHELLOPTS
#set -o igncr

###############################################################################

#  Manage conda environments for Python.  We check the environment variable
#  $CONDA_DEFAULT_ENV to see which environment is desired.  The default (root)
#  environment will be chosen if nothing is specified.  Note that this variable
#  will be explicitly managed by the cyg-activate ( ) function we have defined
#  below, specifically for the purpose of changing environments.  The root
#  environment is also handled slightly different from the others when it comes
#  to setting the CONDA_DEFAULT_ENV variable.

#export CONDA_ENV_BASE_DIR=/c/Users/edward/AppData/Local/conda/conda

if [ ${CONDA_DEFAULT_ENV} ] && [ ${CONDA_DEFAULT_ENV} != 'root' ] 
then
    #  SELECT ONE OF THE NON-DEFAULT ENVIRONMENTS
    #export CONDA_PREFIX=${CONDA_BASE_DIR}/envs/${CONDA_DEFAULT_ENV}
    export CONDA_PREFIX=${CONDA_ENV_BASE_DIR}/envs/${CONDA_DEFAULT_ENV}
else
    #  SELECT THE DEFAULT ENVIRONMENT (and set CONDA_DEFAULT_ENV full path)
    export CONDA_DEFAULT_ENV=root
    export CONDA_PREFIX=${CONDA_BASE_DIR}
fi

###############################################################################

#  Define cyg-conda and cyg-activate to facilitate management of conda.

alias cyg-conda=${CONDA_BASE_DIR}/Scripts/conda.exe

cyg-activate() {
    export CONDA_DEFAULT_ENV=$1
    source ~/cyg-conda.sh
    cyg-conda info --envs
}

###############################################################################

#  PATH - ALl of the anaconda/miniconda path entries appear first.

if [ -z $ORI_SYS_PATH ]; then
	export ORI_SYS_PATH=$PATH
fi

PATH=$ORI_SYS_PATH
PATH=$CONDA_PREFIX:$PATH
PATH=$CONDA_PREFIX/Library/mingw-w64/bin:$PATH
PATH=$CONDA_PREFIX/Library/usr/bin:$PATH
PATH=$CONDA_PREFIX/Library/bin:$PATH
PATH=$CONDA_PREFIX/Scripts:$PATH
#PATH=$PATH:$HOME/scripts
#PATH=$PATH:$HOME/local/bin
#PATH=$PATH:/usr/local/bin
#PATH=$PATH:/usr/bin

export PATH

###############################################################################
