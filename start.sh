#!/bin/bash

rm -f /var/run/xrdp/xrdp.pid
rm -f /var/run/xrdp/xrdp-sesman.pid

mkdir -p /var/run/dbus
dbus-daemon --system --fork

service dbus start
pulseaudio --start --system --disallow-exit --disable-shm
service xrdp start

mkdir -p /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix

tail -f /var/log/xrdp-sesman.log
