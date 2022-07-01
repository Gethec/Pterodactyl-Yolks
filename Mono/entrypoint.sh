#!/bin/bash
cd $HOME

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":${HOME}$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP} 