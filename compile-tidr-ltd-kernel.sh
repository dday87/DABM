#!/bin/bash
echo $SHELL
wget https://git.kernel.org/torvalds/t/linux-5.5-rc5.tar.gz
gpg --sign linux-5.5-rc5.tar.gz
gpg --detach-sign linux-5.5-rc5.tar.gz 
gpg --verify linux-5.5-rc5.tar.gz.sig linux-5.5-rc5.tar.gz
gunzip linux-5.5-rc5.tar.gz 
tar xvf linux-5.5-rc5.tar
rm linux-5.5-rc5.tar
cd $(pwd)/linux-5.5-rc5/
cp -v /boot/config-$(uname -r) .config
sudo yum-builddep ncurses-devel bison flex elfutils-libelf-devel openssl-devel
sudo yum install ncurses-devel bison flex elfutils-libelf-devel openssl-devel
make menuconfig
cp .config ../CONFIG-5.5-rc5
time KBUILD_TIMESTAMP='' CC="gcc" CXX="g++" make -j $(nproc) | tee make-log-5.5-rc5;
sudo make modules_install
sudo make install
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo grubby --set-default /boot/vmlinuz-5.5.0-rc5 
sudo grubby --info=ALL | more
sudo grubby --default-index
sudo grubby --default-kernel
#Th3_J0k3R[]()*;
