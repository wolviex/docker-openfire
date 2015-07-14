#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create  openfire

echo "GRANT ALL ON openfire.* TO openfireuser@localhost IDENTIFIED BY 'openfiredbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

#installing openfire
wget http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_3.10.2_all.deb
mv downloadServlet?filename=openfire%2Fopenfire_3.10.2_all.deb openfire_3.10.2_all.deb
dpkg -i openfire_3.10.2_all.deb
rm openfire_3.10.2_all.deb

#installing sparkweb
wget http://www.igniterealtime.org/downloads/download-landing.jsp?file=sparkweb/sparkweb_0_9_0.tar.gz
mv download-landing.jsp\?file\=sparkweb%2Fsparkweb_0_9_0.tar.gz sparkweb_0_9_0.tar.gz

rm sparkweb_0_9_0.tar.gz

 #to clear some data before saving this layer ...a docker image
 apt-get clean
 rm -rf /tmp/* /var/tmp/*
 rm -rf /var/lib/apt/lists/*
 
killall mysqld
sleep 10s
