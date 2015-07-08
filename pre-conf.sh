#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create  openfire

echo "GRANT ALL ON openfire.* TO openfireuser@localhost IDENTIFIED BY 'openfiredbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

wget http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_3.10.2_all.deb
mv downloadServlet?filename=openfire/openfire_3.10.2_all.deb openfire_3.10.2_all.deb
dpkg -i openfire_3.10.2_all.deb

 #to clear some data before saving this layer ...a docker image
 apt-get clean
 rm -rf /tmp/* /var/tmp/*
 rm -rf /var/lib/apt/lists/*
 
killall mysqld
sleep 10s
