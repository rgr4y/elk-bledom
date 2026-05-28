#!/bin/bash
set -e

# Start dbus daemon
mkdir -p /run/dbus
dbus-daemon --system --nofork &
sleep 1

# Start bluetoothd
bluetoothd &
sleep 2

exec elk-led-control "$@"
