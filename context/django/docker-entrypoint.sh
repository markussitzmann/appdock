#!/bin/bash

echo "Starting with UID : $APPDOCK_UID : $APPDOCK_GID : $APPDOCK_HOME : $APPDOCK_USER"
if id "$APPDOCK_USER" >/dev/null 2>&1; then
    echo "User exists, skipping creation."
else
    echo "Creating user and environment..."
    groupadd -g $APPDOCK_GID $APPDOCK_USER
    useradd --shell /bin/bash -u $APPDOCK_UID -g $APPDOCK_GID -G root -o -c "" -M $APPDOCK_USER
    export HOME=$APPDOCK_HOME
    chown $APPDOCK_UID:$APPDOCK_GID /home/appdock
fi

if [ -z "$(ls -A /home/apps)" ]; then
    echo "Initializing home directory for django ..."
    cp -rf /opt/django/* /home/apps
    mv /home/apps/env /home/apps/.env
    rm /home/apps/docker-entrypoint.sh
    chown -R $APPDOCK_UID:$APPDOCK_GID /home/apps
    echo "Done."
else
    echo "Django home directory isn't empty; skipping initializing content there"
fi

exec "$@"
