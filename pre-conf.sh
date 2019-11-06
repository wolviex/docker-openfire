#!/bin/bash
set -e

#installing openfire
wget -O openfire_4.4.3_all.deb http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4.4.3_all.deb
dpkg -i openfire_4.4.3_all.deb
rm openfire_4.4.3_all.deb

#installing sparkweb
wget -O sparkweb_0_9_0.tar.gz http://www.igniterealtime.org/downloadServlet?filename=sparkweb/sparkweb_0_9_0.tar.gz
tar -xvf sparkweb_0_9_0.tar.gz
rm sparkweb_0_9_0.tar.gz
mv sparkweb /usr/share/openfire/plugins/admin/webapp/
mv /usr/share/openfire/plugins/admin/webapp/sparkweb/SparkWeb.html  /usr/share/openfire/plugins/admin/webapp/sparkweb/index.html
 
 #to clear some data before saving this layer ...a docker image
 apt-get clean
 rm -rf /tmp/* /var/tmp/*
 rm -rf /var/lib/apt/lists/*
