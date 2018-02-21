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

if [ -z "$(ls -A /home/app)" ]; then
    echo "Initializing home directory for django ..."
    cp -rf /opt/django/* /home/app
    mv /home/app/project_template/appsite /home/app
    mv /home/app/env /home/app/.env
    rm -rf /home/app/docker-entrypoint.sh /home/app/docker-compose.init.yml /home/app/project_template
    mv /home/app/docker-compose.app.yml /home/app/docker-compose.yml
    chown -R $APPDOCK_UID:$APPDOCK_GID /home/app
    echo "Done."
else
    echo "Django home directory isn't empty; skipping initializing content there"
fi

exec "$@"
