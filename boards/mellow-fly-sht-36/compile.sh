#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "ERROR: Please run as root"
  exit
fi
cp -f /home/pi/printer_data/config/RatOS/boards/mellow-fly-sht-36/firmware.config /home/pi/klipper/.config
pushd /home/pi/klipper
make olddefconfig
make clean
make

if [ ! -d "/home/pi/klipper_config/firmware_binaries" ]
then
    mkdir /home/pi/klipper_config/firmware_binaries
    chown pi:pi /home/pi/klipper_config/firmware_binaries
fi
cp -f /home/pi/klipper/out/klipper.bin /home/pi/klipper_config/firmware_binaries/firmware-mellow-fly-sht-36.bin
chown pi:pi /home/pi/klipper_config/firmware_binaries/firmware-mellow-fly-sht-36.bin
popd
