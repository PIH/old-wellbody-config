#!/bin/bash

WORKING_DIRECTORY="$PWD"
INSTALL_DIRECTORY=/opt/pih
SOURCE_DIRECTORY=/vagrant/openmrs
BAHMNI_OPENMRS_CONFIG_DIR=/var/www/bahmni_config/openmrs
IMPLEMENTATION_NAME=sierraleone
ENVIRONMENT_NAME=test

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

function runLiquibase() {
	if [ -d "$SOURCE_DIRECTORY" ]; then
		echo "Executing the liquibase file at $BAHMNI_OPENMRS_CONFIG_DIR/migrations/liquibase.xml"
		source /opt/bahmni-installer/bahmni-playbooks/roles/implementation-config/files/run-implementation-openmrs-liquibase.sh
	else
		echo "No local liquibase found to update"
	fi
}

function updateConfig() {
	# This emulates the code behind the "bahmni update-config" command, which seems to run too slow to use regularly
	if [ -d "$SOURCE_DIRECTORY" ]; then
		echo "Copying configuration from $SOURCE_DIRECTORY to $BAHMNI_OPENMRS_CONFIG_DIR"
		rm -fR $BAHMNI_OPENMRS_CONFIG_DIR
		cp -rf $SOURCE_DIRECTORY $BAHMNI_OPENMRS_CONFIG_DIR
		chmod -R 755 $BAHMNI_OPENMRS_CONFIG_DIR
		chown -R bahmni: $BAHMNI_OPENMRS_CONFIG_DIR
		ln -sf /var/www/bahmni_config/openmrs/obscalculator /opt/openmrs/obscalculator
		ln -sf /var/www/bahmni_config/openmrs/ordertemplates /opt/openmrs/ordertemplates
		ln -sf /var/www/bahmni_config/openmrs/encounterModifier /opt/openmrs/encounterModifier
		ln -sf /var/www/bahmni_config/openmrs/patientMatchingAlgorithm /opt/openmrs/patientMatchingAlgorithm
		rm -fR /opt/openmrs/bahmni_config
		ln -sf /var/www/bahmni_config /opt/openmrs/bahmni_config
	else
		echo "No local configuration found to update"
	fi
}

case $1 in
	install)
		if hash bahmni 2>/dev/null; then
			echo "Distribution already installed"
			exit 1;
		else
			echo "Installing distribution into $INSTALL_DIRECTORY "
			mkdir -p $INSTALL_DIRECTORY
			cd $INSTALL_DIRECTORY

			echo "Installing Dependencies"
			yum -y install git

			echo "Cloning deployment package into $INSTALL_DIRECTORY/deployment"
			git clone https://github.com/PIH/pih-deployment.git deployment
			cd deployment

			echo "Deploying latest distribution"
			source deploy.sh $IMPLEMENTATION_NAME $ENVIRONMENT_NAME

			cd $WORKING_DIRECTORY
		fi
		;;

	update-full)
		echo "Updating distribution"
		cd $INSTALL_DIRECTORY/deployment
		git pull --rebase
		source deploy.sh $IMPLEMENTATION_NAME $ENVIRONMENT_NAME
  		;;

  	copy-openmrs-config)
  		updateConfig
  		;;

  	run-liquibase)
  		updateConfig
  		runLiquibase
  		;;

  	restart)
  		echo "Restarting Bahmni"
  		bahmni stop
  		bahmni start
  		;;

  	log)
  		tail -f /opt/openmrs/log/openmrs.log
  		;;

	*)
		echo "USAGE:"
		echo ""
		echo "  install:                Installs the distribution"
		echo "  run-liquibase:          Updates local configuration and liquibase changes without restarting Bahmni"
		echo "  copy-openmrs-config:    Updates local configuration without restarting Bahmni"
		echo "  update-full:            Re-runs the distribution with the latest package and local configurations"
		echo "  restart:                Restarts the distribution"
		echo "  log:                    Tails the OpenMRS log file"
		echo ""
		;;
esac




