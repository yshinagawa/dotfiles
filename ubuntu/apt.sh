#!/usr/bin/env bash
set -eux

export DEBIAN_FRONTEND=noninteractive

sudo -E apt-get -qq update
sudo -E apt-get -q -y install git stow
sudo -E apt-get -y clean
