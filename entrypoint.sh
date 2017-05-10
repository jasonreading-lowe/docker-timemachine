#!/bin/bash

set -e

mkdir -p /conf.d/netatalk

if [ ! -e /.initialized_user ]; then

    addgroup afp

    adduser -S -H -G root munkiadmin
    echo munkiadmin:test | chpasswd
    adduser -S -H -G root casperadmin
    echo casperadmin:test | chpasswd
    adduser -S -H -G root readonly
    echo readonly:test | chpasswd

    touch /.initialized_user
fi

#chgrp -R afp /shares/
chmod +x /shares
chmod +x /shares/*
chmod +x /start_netatalk.sh

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf