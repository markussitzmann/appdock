#!/bin/bash

#echo "PYTHON-CONDA Starting with UID : $APPDOCK_UID : $APPDOCK_GID : $APPDOCK_HOME : $APPDOCK_USER"
#groupadd -g $APPDOCK_GID $APPDOCK_USER
#useradd --shell /bin/bash -u $APPDOCK_UID -g $APPDOCK_GID -o -c "" -m $APPDOCK_USER
#export HOME=$APPDOCK_HOME
#chown $APPDOCK_UID:$APPDOCK_GID /home/appdock

#exec gosu $APPDOCK_USER "$@"