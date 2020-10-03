#!/bin/sh

mkdir -p $HOME/.local/bin
cp run-upplay-docker $HOME/.local/bin
chmod u+x $HOME/.local/bin/run-upplay-docker

mkdir -p $HOME/.local/share/icons/
cp upplay-docker.png $HOME/.local/share/icons/

mkdir -p $HOME/.local/share/applications
cp upplay-docker.desktop $HOME/.local/share/applications
