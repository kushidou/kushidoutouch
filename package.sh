#!/bin/bash
# 2021-09-15 15:40 +8
# copyright: kushidou

echo -e "input your PASSWD(plaintext):\c"
read ROOTPASSWD

echo $ROOTPASSWD | sudo -S chmod 755 ./kushidoutouch/DEBIAN
echo $ROOTPASSWD | sudo -S chmod 755 ./kushidoutouch/DEBIAN/*
# get version
vers=$(cat ./kushidoutouch/DEBIAN/control | grep 'Version:' | cut -d ' ' -f 2)
arch=$(cat ./kushidoutouch/DEBIAN/control | grep 'Architecture:' | cut -d ' ' -f 2)
echo "ver=$vers, arch=$arch"

# check mod
echo $ROOTPASSWD | sudo -S chmod +x ./kushidoutouch/var/kushidou-touchscreen/*-screen
echo $ROOTPASSWD | sudo -S chmod +x -R ./kushidoutouch/var/kushidou-touchscreen/desktops/*.desktop

dpkg -b ./kushidoutouch ./kushidouTouch-${vers}_${arch}.deb > /dev/null
echo $ROOTPASSWD | sudo -S sudo chmod 755 *.deb
echo "Please check kushidouTouch-${vers}_${arch}.deb"
