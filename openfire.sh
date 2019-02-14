#!/bin/sh
### In openfire.sh (make sure this file is chmod +x):
# `/sbin/setuser openfire` runs the given command as the user `openfire`.
# If you omit that part, the command will be run as root.

#check this file
if [ -f /etc/default/openfire ] ; then
        . /etc/default/openfire
fi

JAVA_HOME=/usr
PATH=/sbin:/bin:/usr/sbin:/usr/bin:${JAVA_HOME}/bin
JAVA=${JAVA_HOME}/bin/java
NAME=openfire
DESC=openfire
DAEMON_DIR=/usr/share/openfire
DAEMON_LIB=${DAEMON_DIR}/lib

DAEMON_OPTS="-server -DopenfireHome=${DAEMON_DIR} \
 -Dopenfire.lib.dir=${DAEMON_LIB} -Dlog4j.configurationFile=${DAEMON_LIB}/log4j2.xml -classpath ${DAEMON_LIB}/startup.jar\
 -jar ${DAEMON_LIB}/startup.jar"


exec $JAVA $DAEMON_OPTS
