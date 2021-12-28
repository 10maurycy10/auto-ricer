#!/bin/sh
echo 240 | sudo tee /sys/devices/rmi4-00/rmi4-00.fn03/serio2/sensitivity
echo 240 | sudo tee /sys/devices/rmi4-00/rmi4-00.fn03/serio2/speed 
