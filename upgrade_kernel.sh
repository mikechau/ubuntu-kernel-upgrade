#!/bin/sh
#script based on the one found on upbuntu.com

echo "$(tput setaf 3)--- Kernel 3.9.2 will be installed in an `uname -i` system---$(tput sgr0)"

echo ""

sleep 2

read -p "Press Enter to continue, or abort by pressing CTRL+C" nothing

echo ""
echo ""

#i386 links

link1="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9.2-saucy/linux-headers-3.9.2-030902_3.9.2-030902.201305111035_all.deb"

link2="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9.2-saucy/linux-headers-3.9.2-030902-generic_3.9.2-030902.201305111035_i386.deb"

link3="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9.2-saucy/linux-image-3.9.2-030902-generic_3.9.2-030902.201305111035_i386.deb"

#amd64 links

url1="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9.2-saucy/linux-headers-3.9.2-030902-generic_3.9.2-030902.201305111035_amd64.deb"

url2="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.9.2-saucy/linux-image-3.9.2-030902-generic_3.9.2-030902.201305111035_amd64.deb"

#url3="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.8.8-raring/linux-image-extra-3.8.8-030808-generic_3.8.8-030808.201304170248_amd64.deb"

#System architecture

arch=`uname -m`
if  [ $arch = i686 ] || [ $arch = i386 ]; then

mkdir -p $HOME/kernel-i386

cd $HOME/kernel-i386

wget -c $link1
wget -c $link2
wget -c $link3
#wget -c $link4

sudo dpkg -i *.deb

sudo rm -rf $HOME/kernel-i386

elif [ $arch = "x86_64" ]; then


mkdir -p $HOME/kernel-amd64

cd $HOME/kernel-amd64

wget -c $link1
wget -c $url1
wget -c $url2
#wget -c $url3

sudo dpkg -i *.deb

sudo rm -rf $HOME/kernel-amd64

     else
        echo "Unsupported Architecture"
fi

