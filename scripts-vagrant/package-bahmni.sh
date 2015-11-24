#!/bin/bash

# packages BAHMNI components from the vagrant box 
# needs to be run as sudo

cd "$(dirname "$0")"

service tomcat stop
sleep 10

DIST_DIR=./bahmni-dist-temp
MYSQL_USER=openmrs-user
MYSQL_PASSWORD=password

rm -rf $DIST_DIR
mkdir $DIST_DIR

tar -czf $DIST_DIR/dot.OpenMRS.tgz --directory=/home/bahmni .OpenMRS
tar -chzf $DIST_DIR/bahmni_config.tgz --directory=/var/www bahmni_config --exclude=$DIST_DIR
tar -czf $DIST_DIR/openmrs.webapp.tgz --directory=/home/bahmni/apache-tomcat-8.0.12/webapps openmrs
tar -czf $DIST_DIR/bahmnireports.webapp.tgz --directory=/home/bahmni/apache-tomcat-8.0.12/webapps bahmnireports
tar -czf $DIST_DIR/bahmniapps.tgz --directory=/var/www bahmniapps
mysqldump -u $MYSQL_USER -p`echo $MYSQL_PASSWORD` openmrs > $DIST_DIR/openmrs.mysqldump.sql
# get rid of relevatreference to openmrs-user in sql dump


cp ./configs/* $DIST_DIR


