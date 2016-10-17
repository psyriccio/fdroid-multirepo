#!/bin/bash
export USR=fdroid
export HM=/home/$USR
export BASE=/srv/http/fdroid
export REPO=$BASE/repo
export OLDPWD=$(pwd)
sudo -u $USR fdroidcl update;
for i in $(cat fdroid.lst); do
	echo $i;
	sudo -u $USR fdroidcl download $i;
done;
cp -R --force $HM/.cache/fdroidcl/apks/* $REPO
cd $BASE/upstreams
sudo -u $USR raccoon -a $HM/.cache/gpArh -i ./gplay.lst
sudo -u $USR raccoon -a $HM/.cache/gpArh -u
cd $HM/.cache/gpArh
for i in $(find -name "*.apk"); do
    cp $i $REPO/
done;
cd ../
for i in $(find $HM/.cache/gpArh/ -name "*.apk"); do
	echo $i
	cp --force $i $REPO/
done;
cd $BASE
sudo chmod -R 664 $REPO/*
for dr in $(find $REPO/ -type d); do
	sudo chmod 775 $dr
done;
sudo chown -R psyriccio:wheel $REPO/*
sudo fdroid update -c --pretty -v
cd $OLDPWD
