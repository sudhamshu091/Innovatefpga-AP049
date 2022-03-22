#!/bin/bash
############################################################
#                                                          #
# Nios2 Software Build Tools (SBT) Command Shell           #
#                                                          #
# Execute this script to setup an environment for          #
# using the Nios2eds Software Build Tools (SBT)            #
#                                                          #
# This shell uses nios2-elf-gcc             	           #
#                                                          #
#                                                          #
# Copyright (c) 2019 Intel Corporation                     #
# All Rights Reserved.                                     #
#                                                          #
############################################################

############################################################
#
# Get the Root ACDS directory
#

# Don't delimit on whitespace so that dirname is happy with
# spaces in paths
IFS=

uname=$(uname -r)
if [[ $uname =~ "Microsoft" ]]
then
    if [ -z $(which wsl 2> /dev/null) ]; then
        echo "Command 'wsl' not found.  Please install with:"
		echo "    sudo apt install wsl"
    fi
	if [ -z $(which make 2> /dev/null) ]; then
        echo "Command 'make' not found.  Please install with:"
		echo "    sudo apt install make"
    fi
	if [ -z $(which dos2unix 2> /dev/null) ]; then
        echo "Command 'dos2unix' not found.  Please install with:"
		echo "    sudo apt install dos2unix"
    fi
	if [ -z $(which wsl 2> /dev/null) ] || [ -z $(which make 2> /dev/null) ] || [ -z $(which dos2unix 2> /dev/null) ]; then
		exit 1
    fi	
fi

_this_nios2_command_shell_script=$(cd ${0%[\\/]*} && echo $(pwd 2>/dev/null)/${0##*/})
_ACDS_ROOT=$(dirname $(dirname ${_this_nios2_command_shell_script}))
unset _this_nios2_command_shell_script

if [ ! -d "${_ACDS_ROOT}/nios2eds" ]; then
    echo "${_ACDS_ROOT}/nios2eds not found. Invalid or corrupt ACDS Install" 1>&2
    exit 1
fi

if [ -z "${QUARTUS_ROOTDIR_OVERRIDE}" ]; then
    if [ ! -d "${_ACDS_ROOT}/quartus" ]; then
        echo "${_ACDS_ROOT}/quartus not found. Invalid or corrupt ACDS Install" 1>&2
        exit 1
    fi
fi

############################################################

############################################################
#
# Convenience bash functions for setting up the environment
#

env_var_delete () {
    local var=${2:-PATH}
    local value
    local IFS=':'
    for i in ${!var} ; do
        if [ "$i" != "$1" ] ; then
            value=${value:+$value:}$i
        fi
    done
    export $var="$value"
}

env_var_prepend () {
    env_var_delete $1 $2
    local var=${2:-PATH}
    export $var="$1${!var:+:${!var}}"
}

env_var_append () {
    env_var_delete $1 $2
    local var=${2:-PATH}
    export $var="${!var:+${!var}:}$1"
}
############################################################


############################################################
#
# Setup Quartus II
#

if [ -n "${QUARTUS_ROOTDIR_OVERRIDE}" ]; then
    QUARTUS_ROOTDIR=${QUARTUS_ROOTDIR_OVERRIDE}
else
    QUARTUS_ROOTDIR=${_ACDS_ROOT}/quartus
fi

env_var_prepend "${QUARTUS_ROOTDIR}/sopc_builder/bin"

if [ -d "${QUARTUS_ROOTDIR}/bin64" ]; then
	if [ -d "${QUARTUS_ROOTDIR}/bin32" ]; then
		env_var_prepend "${QUARTUS_ROOTDIR}/bin32"
	fi
    env_var_prepend "${QUARTUS_ROOTDIR}/bin64"
else
    env_var_prepend "${QUARTUS_ROOTDIR}/bin"
fi

export QUARTUS_ROOTDIR
############################################################


############################################################
#
# Setup Modelsim AE
#  (if modelsim_ae/modelsim_ase directory exists and vsim not in PATH)
#

if [ -z "$(which vsim 2>/dev/null)" ]; then

    if [ "${_IS_WINDOWS}" = "1" ]; then
        _VSIM_EXEC_DIR=win32aloem
    else
        _VSIM_EXEC_DIR=linuxaloem
    fi

    if [ -d "${_ACDS_ROOT}/modelsim_ae/${_VSIM_EXEC_DIR}" ]; then
        env_var_prepend "${_ACDS_ROOT}/modelsim_ae/${_VSIM_EXEC_DIR}"
    else
        if [ -d "${_ACDS_ROOT}/modelsim_ase/${_VSIM_EXEC_DIR}" ]; then
            env_var_prepend "${_ACDS_ROOT}/modelsim_ase/${_VSIM_EXEC_DIR}"
        fi
    fi
    unset _VSIM_EXEC_DIR
fi
############################################################


############################################################
#
# Setup Nios2eds (GCC 4)
#

SOPC_KIT_NIOS2=${_ACDS_ROOT}/nios2eds

env_var_prepend "${SOPC_KIT_NIOS2}/bin"
env_var_prepend "${SOPC_KIT_NIOS2}/sdk2/bin"

if grep -q Microsoft /proc/version; then
    if [ -d "${SOPC_KIT_NIOS2}/bin/gnu/H-x86_64-mingw32/bin" ]; then
	    env_var_prepend ${SOPC_KIT_NIOS2}/bin/gnu/H-x86_64-mingw32/bin
    else
    	env_var_prepend ${SOPC_KIT_NIOS2}/bin/gnu/H-i686-mingw32/bin
    fi
else
    if [ -d "${SOPC_KIT_NIOS2}/bin/gnu/H-x86_64-pc-linux-gnu/bin" ]; then
	    env_var_prepend ${SOPC_KIT_NIOS2}/bin/gnu/H-x86_64-pc-linux-gnu/bin
    else
	    env_var_prepend ${SOPC_KIT_NIOS2}/bin/gnu/H-i686-pc-linux-gnu/bin
    fi
fi

export SOPC_KIT_NIOS2

# Set Windows Subsystem for Linux environment variable interop between Win32/WSL.
export WSLENV=QUARTUS_ROOTDIR/p:SOPC_KIT_NIOS2/p:PATH/p
############################################################

unset _ACDS_ROOT
unset _NIOS2EDS_ROOT
unset _QUARTUS_ROOT
unset env_var_prepend
unset env_var_append
unset env_var_remove


if [ -n "$*" ]; then
    exec $@
else
    echo "------------------------------------------------"
    echo "Altera Nios2 Command Shell"
    echo
    echo "Version 21.1, Build 842"
    echo "------------------------------------------------"

    # Use bash --norc to get a clean shell
    # Use bash --rcfile <bashrc> to for a user rcfile
    # Default to using ~/.bashrc
    bash
fi
