#!/bin/bash

echo "Starting with UID : $APPDOCK_UID : $APPDOCK_GID : $APPDOCK_HOME : $APPDOCK_USER"
if id "$APPDOCK_USER" >/dev/null 2>&1; then
    echo "User exists, skipping creation."
else
    echo "Creating user ..." && \
    groupadd -g $APPDOCK_GID $APPDOCK_USER && \
    useradd --shell /bin/bash -u $APPDOCK_UID -g $APPDOCK_GID -o -c "" -M $APPDOCK_USER && \
    export HOME=$APPDOCK_HOME && \
    echo "Done."
fi

if [ -z "$(ls -A /home/appdock)" ];  then
    echo "Initializing home directory for appdock ..."
    cp /opt/appdock/bin/* /home/appdock
    cp /opt/appdock/bin/.env /home/appdock
    chown -R $APPDOCK_UID:$APPDOCK_GID /home/appdock
    echo "Done."
else
    echo "Appdock home directory isn't empty, skipping initializing content there"
fi



exec "$@"