#!/bin/bash
 


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DEBIAN_FRONTEND=noninteractive
product=$1

################################################ EI 6.4.0 ####################################################
sudo apt-get update
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
echo "Installing mysql-client"
sudo apt-get install -q -y mysql-client
echo "Installing pip"
sudo apt install -q -y python-pip
echo "Installing maven"
sudo apt install -q -y maven
echo "Copying $product ..."
cp /tmp/$product /home/ubuntu/
cp /tmp/jdk-8u144-linux-x64.tar.gz /opt
cp /tmp/jdk-8u192-ea-bin-b02-linux-x64-19_jul_2018.tar.gz /opt
cp /tmp/util/ei/provision_db_ei.sh /usr/local/bin/
mkdir /home/ubuntu/ei
cp /tmp/util/ei/ei.sql /home/ubuntu/ei/ei.sql
chmod +x /home/ubuntu/ei/ei.sql
chmod +x /usr/local/bin/provision_db_ei.sh

#echo "Copying sources.list ..."
#sudo cp -f /tmp/conf/sources.list /etc/apt/sources.list.old -v
#echo "deb http://security.ubuntu.com/ubuntu bionic-security main restricted
#deb http://security.ubuntu.com/ubuntu bionic-security universe
#deb http://security.ubuntu.com/ubuntu bionic-security multiverse" > /etc/apt/sources.list
echo "Copying sysctl.conf ..."
sudo cp /tmp/conf/sysctl.conf /etc/sysctl.conf -v
echo "Copying limits.conf ..."
sudo cp /tmp/conf/limits.conf /etc/security/limits.conf  -v
echo 'export HISTTIMEFORMAT="%F %T "' >> /etc/profile.d/history.sh
cat /dev/null > ~/.bash_history && history -c
