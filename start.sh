#!/bin/bash

docker build -t xrdp .
docker run -d -p 3389:3389 -v xrdp-root-home:/root --name xrdp-root-wine-audio xrdp

service dbus start
pulseaudio --start --system --disallow-exit --disable-shm
service xrdp start

mkdir -p /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix

tail -f /var/log/xrdp-sesman.log
