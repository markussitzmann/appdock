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

#cd /home/appdock
#exec "$@"

#mkdir /home/apps
cp -r /opt/django-app/project_template/appsite /home/apps
cp -r /opt/django-app/scripts/* /home/apps
cp /opt/django-app/* /home/apps
mv /home/apps/env .env
chown -R $APPDOCK_UID:$APPDOCK_GID /home/apps
chmod -R 755 /home/apps

exec "$@"
