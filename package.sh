#!/bin/bash
# 2021-09-15 15:40
# 2021-09-30 11:00
# 2021-10-08 11:10
# copyright: kushidou

POSTINST=./kushidoutouch/DEBIAN/postinst

echo "Checking [control] mode..."
if [ $(ls -l ./kushidoutouch/DEBIAN/control | cut -d ' ' -f1) != "-rwxr-xr-x" ];then
    echo "[control] != 0755!"
    echo -e "Input your PASSWD(plaintext):\c"
    read ROOTPASSWD
    echo $ROOTPASSWD | sudo -S chmod 755 ./kushidoutouch/DEBIAN
    echo $ROOTPASSWD | sudo -S chmod 755 ./kushidoutouch/DEBIAN/*
fi

# get version
vers=$(cat ./kushidoutouch/DEBIAN/control | grep 'Version:' | cut -d ' ' -f 2)
arch=$(cat ./kushidoutouch/DEBIAN/control | grep 'Architecture:' | cut -d ' ' -f 2)

sed -i "3c BUILDDATE=\"$(date)\"" $POSTINST
sed -i "4c KTVERSION=\"$vers\"" $POSTINST

gzip ./kushidoutouch/usr/share/kushidoutouch/changelog

echo "ver=$vers, arch=$arch"
echo "Packing..."
dpkg -b ./kushidoutouch ./kushidouTouch-${vers}_${arch}.deb

if [[ 0 -ne $? ]];then
    echo -e "\e[47;31mError\e[0m"
else
    echo "Please check kushidouTouch-${vers}_${arch}.deb"
fi
