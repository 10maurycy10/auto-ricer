#!/bin/bash
echo "Enter root passord:"
su -c "pacman -S git"
git clone https://github.com/10maurycy10/auto-ricer.git
pushd auto-ricer
./install.sh
popd
