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
    cp -rf /opt/django/project_template/appsite /home/apps
    cp -rf /opt/django/scripts/* /home/apps
    cp /opt/django/* /home/apps
    cp /env /home/apps/.env
    cp /docker-compose.yml /home/apps
    chown -R $APPDOCK_UID:$APPDOCK_GID /home/apps
    chmod -R 755 /home/apps
else
    echo "Django home directory isn't empty; skipping initializing content there"
fi

exec "$@"
