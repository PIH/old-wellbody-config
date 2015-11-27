#!/bin/bash

TOMCAT_DIR=/Users/xian/projects/pih-sierraleone/local-bahmni/apache-tomcat-7.0.65
BAHMNI_DIST_DIR=~/b

#sudo service tomcat7 stop
#$TOMCAT_DIR/bin/shutdown.sh

cd $TOMCAT_DIR/webapps

# save configs
cp $TOMCAT_DIR/webapps/bahmnireports/WEB-INF/classes/application.properties /tmp
rm -rf $TOMCAT_DIR/temp/*
rm -rf $TOMCAT_DIR/work/*
rm -rf $TOMCAT_DIR/webapps/openmrs* $TOMCAT_DIR/webapps/bahmnireports* $TOMCAT_DIR/webapps/bahmni_config* $TOMCAT_DIR/webapps/bahmniapps*

tar xzf $BAHMNI_DIST_DIR/bahmnireports.webapp.tgz
tar xzf $BAHMNI_DIST_DIR/openmrs.webapp.tgz
tar xzf $BAHMNI_DIST_DIR/bahmni_config.tgz
tar xzf $BAHMNI_DIST_DIR/bahmniapps.tgz
mv /tmp/application.properties $TOMCAT_DIR/webapps/bahmnireports/WEB-INF/classes/application.properties

echo "edit $TOMCAT_DIR/webapps/bahmnireports/WEB-INF/classes/application.properties and adjust as needed"

cd ~

cp .OpenMRS/openmrs-runtime.properties /tmp
rm ~/.OpenMRS/modules/*
tar xzf $BAHMNI_DIST_DIR/dot.OpenMRS.tgz 
#mv dot.OpenMRS/ .OpenMRS
#mkdir .OpenMRS/patient_images
mv /tmp/openmrs-runtime.properties ~/.OpenMRS/openmrs-runtime.properties
#sudo sed -i.bak "s/root/home\/tomcat7/g" /home/tomcat7/.OpenMRS/bahmnicore.properties

echo "edit /home/tomcat7/.OpenMRS/openmrs-runtime.properties and change connection.* as needed"

#sudo service tomcat7 start

