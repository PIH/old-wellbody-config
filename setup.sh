#!/bin/bash

INSTALL_DIRECTORY=/etc/pih

# This will never happen in a vanilla vagrant setup.  Adding it as a safeguard against accidental invocation on another system.
if [ -d "$INSTALL_DIRECTORY" ]; then
	while true; do
		read -e -p "This directory already exists and will be deleted and recreated, continue (yes/no)?  " -i "no" CREATE_FOLDER
		case $CREATE_FOLDER in
			[Yy]* )
			  break;;
			[Nn]* )
			  echo "Exiting installation"
			  exit 1;;
			* )
			echo "Please answer 'yes' or 'no'.";;
		esac
	done
fi

echo "Installing distribution into $INSTALL_DIRECTORY "
rm -fR $INSTALL_DIRECTORY
mkdir -p $INSTALL_DIRECTORY
cd $INSTALL_DIRECTORY

echo "Installing Git..."
yum -y -q install git

echo "Cloning deployment package into $INSTALL_DIRECTORY/deployment"
git clone https://github.com/PIH/pih-deployment.git deployment
cd deployment

echo "Environment setup complete.  Run '$INSTALL_DIRECTORY/deployment/deploy.sh <implementation_name> <environment_name>' to install Bahmni"
