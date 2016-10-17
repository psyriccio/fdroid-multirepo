#!/bin/bash
export HM=/home/fdroid
export BASE=/srv/http/fdroid
export REPO=$BASE/repo
export CACHE=$HM/.cache
export FDEL1=$CACHE/fdroidcl
export FDEL2=$CACHE/gpArh/apk_storage

sudo rm -rf $FDEL1
sudo rm -rf $FDEL2
sudo rm -rf $BASE/tmp/*

cd $BASE/upstreams
./update.sh
