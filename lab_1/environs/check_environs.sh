#!/usr/bin/env bash

> server.conf

if [[ -z "$SERVER_NAME" ]]; then
    echo 'SERVER_NAME="StarCraft"' >> server.conf
else
    echo "SERVER_NAME=\"$SERVER_NAME\"" >> server.conf
fi

if [[ -z "$MAX_PLAYERS" ]]; then
    echo 'MAX_PLAYERS="125"' >> server.conf
else
    echo "MAX_PLAYERS=\"$MAX_PLAYERS\"" >> server.conf
fi

if [[ -z "$SPAWN_COORDS" ]]; then
    echo 'SPAWN_COORDS="274 67 -249"' >> server.conf
else
    echo "SPAWN_COORDS=\"$SPAWN_COORDS\"" >> server.conf
fi

cat server.conf
