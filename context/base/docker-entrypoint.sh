#!/bin/bash

echo "Starting with UID : $APPDOCK_UID : $APPDOCK_GID : $APPDOCK_HOME : $APPDOCK_USER"
if id "$APPDOCK_USER" >/dev/null 2>&1; then
    echo "User exists, skipping creation."
else
    echo "Creating user ..."
    groupadd -g $APPDOCK_GID $APPDOCK_USER
    useradd --shell /bin/bash -u $APPDOCK_UID -g $APPDOCK_GID -o -c "" -M $APPDOCK_USER
    export HOME=$APPDOCK_HOME
    #chown $APPDOCK_UID:$APPDOCK_GID /home/appdock
fi

cp -r /opt/appdock/* /home/appdock
chown -R $APPDOCK_UID:$APPDOCK_GID /home/appdock


#cd /home/appdock
#exec gosu $APPDOCK_USER "$@"
exec "$@"