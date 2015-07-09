#!/bin/sh
### In openfire.sh (make sure this file is chmod +x):
# `/sbin/setuser openfire` runs the given command as the user `openfire`.
# If you omit that part, the command will be run as root.

if [ -f /etc/default/openfire ] ; then
        . /etc/default/openfire
fi

if [ -z $JAVA_HOME ]; then
 JAVA_HOME=$(LC_ALL=C update-alternatives --display java \
    | grep best \
    | grep -oe \/.*\/bin\/java \
    | sed 's/\/bin\/java//g')
    echo "best java alternative in: "$JAVA_HOME
fi


PATH=/sbin:/bin:/usr/sbin:/usr/bin:${JAVA_HOME}/bin
JAVA=${JAVA_HOME}/bin/java
NAME=openfire
DESC=openfire
DAEMON_DIR=/usr/share/openfire
DAEMON_LIB=${DAEMON_DIR}/lib

DAEMON_OPTS="$DAEMON_OPTS -server -DopenfireHome=${DAEMON_DIR} \
 -Dopenfire.lib.dir=${DAEMON_LIB} -classpath ${DAEMON_LIB}/startup.jar\
 -jar ${DAEMON_LIB}/startup.jar"


exec start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
                --exec $JAVA --retry 4
