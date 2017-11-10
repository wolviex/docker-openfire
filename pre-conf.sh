#!/bin/bash
set -e

#installing openfire
wget http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4.1.6_all.deb
mv downloadServlet?filename=openfire%2Fopenfire_4.1.6_all.deb openfire_4.1.6_all.deb
dpkg -i openfire_4.1.6_all.deb
rm openfire_4.1.6_all.deb

#installing sparkweb
wget http://www.igniterealtime.org/downloadServlet?filename=sparkweb/sparkweb_0_9_0.tar.gz
mv downloadServlet?filename=sparkweb%2Fsparkweb_0_9_0.tar.gz sparkweb_0_9_0.tar.gz
tar -xvf sparkweb_0_9_0.tar.gz
rm sparkweb_0_9_0.tar.gz
mv sparkweb /usr/share/openfire/plugins/admin/webapp/
mv /usr/share/openfire/plugins/admin/webapp/sparkweb/SparkWeb.html  /usr/share/openfire/plugins/admin/webapp/sparkweb/index.html
 
 #to clear some data before saving this layer ...a docker image
 apt-get clean
 rm -rf /tmp/* /var/tmp/*
 rm -rf /var/lib/apt/lists/*
