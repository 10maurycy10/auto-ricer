#!/bin/sh
export GOPATH="$HOME/.local/share/go"
export GOROOT="/usr/lib/go"
export GOBIN="$GOPATH/bin"

mkdir buildtmp
pushd buildtmp
tar -xzvf ../arc/clipman.tar.gz
cd clipman
go install
popd
rm -rf buildtmp

