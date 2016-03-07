#!/bin/bash

WORKING_DIRECTORY="$PWD"
INSTALL_DIRECTORY=/opt/pih
SOURCE_DIRECTORY=/vagrant/openmrs

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

function updateConfig() {
	echo "Copying configuration from /vagrant/openmrs to /var/www/bahmni_config/openmrs"
	rm -fR /var/www/bahmni_config/openmrs
	cp -rf /vagrant/openmrs /var/www/bahmni_config/openmrs
}

function runLiquibase() {
	echo "Executing the liquibase file at /var/www/bahmni_config/openmrs/migrations/liquibase.xml"

}

case $1 in
	install)
		if hash bahmni 2>/dev/null; then
			echo "Distribution already installed"
			exit 1;
		else
			echo "Running distro install"

			echo "Installing into $INSTALL_DIRECTORY"
			mkdir -p $INSTALL_DIRECTORY
			cd $INSTALL_DIRECTORY

			echo "Installing Dependencies"
			yum -y install git

			echo "Cloning deployment package into $INSTALL_DIRECTORY/deployment"
			git clone https://github.com/PIH/pih-deployment.git deployment
			cd deployment

			echo "Running deployment script"
			./deploy.sh sierraleone test

			if [ -d "$SOURCE_DIRECTORY" ]; then
				echo "Found local configuration at /vagrant/openmrs, updating..."
				echo "Stopping Bahmni"
				bahmni stop
				updateConfig
				echo "Starting Bahmni"
				bahmni start
			fi

			cd $WORKING_DIRECTORY
		fi
		;;

	update)
		updateConfig
		runLiquibase
  		;;

  	restart)
  		echo "Restarting Bahmni"
  		bahmni stop
  		bahmni start
  		;;

	*)
		echo "USAGE:"
		echo ""
		echo "  install: Installs the distribution"
		echo "  update:  Updates the distribution configuration and liquibase"
		echo "  restart: Restarts the distribution Tomcat"
		echo ""
		;;
esac




