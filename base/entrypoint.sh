#!/bin/bash

USER_ID=${TUG_UID:-9001}
GROUP_ID=${TUG_GID:-9001}
HOME_DIR=${TUG_HOME:-/home/tug}

echo "Starting with UID : $USER_ID : $GROUP_ID : $HOME_DIR"
groupadd -g $GROUP_ID tug
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -o -c "" -m tug
export HOME=$HOME_DIR
chown $TUG_UID:$TUG_GID /home/tug

exec /usr/local/bin/gosu tug "$@"