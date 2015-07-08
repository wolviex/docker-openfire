#!/bin/bash

#Backup mysql
mysqldump -u root -pmysqlpsswd --all-databases > /var/backups/alldb_backup.sql

#Backup important file ... of the configuration ...
cp  /etc/hosts  /var/backups/

#Backup importand files relate to app
