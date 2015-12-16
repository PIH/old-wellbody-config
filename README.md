# wellbody-config

Contains relevant customizations of Bahmni for the Wellbody Clinic in Sierra Leone. Currently the installation/update is not fully automised and requires some 'hand-crafting' steps on the target server.

In a nutshell the deployment
- does not make use of the default Bahmni installation process (via its RPM packages)
- requires a default PIH-EMR server environment (based on Ubuntu)
- uses 'binary' components (aka archives) of relevant Bahmni components
- the components can/need to be derived from a 'golden master' installation (either the Bahmni vagrant or docker environment with vagrant being used more recently).
- has no proper OpenMRS metadata handling; most important it doesn't create a DB instance from scratch, but requires the import of an initial OpenMRS MySQL dump 

The 'binary' components are not part of this github project, but the basic scripts to install a new and update an existing environment are included in the scripts-vagrant folder (the files under scripts-docker is currently not used/well tested).

# Initial installation

The script script-vagrant/installation.sh contains the necessary steps to prepare a default PIH-EMR server environment for a Bahmni installation. This script lacks testing and verfication, so for now it should only be used as a documantational guide for someone who follows these individual lines to manually install Bahmni from a shell.

Note that a 'side-by-side' installation Bahmni in parallel to the PIH-EMR is currently not supported (clash of .OpenMRS dirs, webapp context paths, port overlaps, Apache HTTPS configs). This is nothing unsolveable, but wasn't pushed further yet. So before installing Bahmni, make sure that the PIH-EMR is not actively running (by shutting down its Tomcat process and also disabling its auto-start after boot).

Once the initial installation/preparation is done, continue with the Update process to get/update all 'binary' Bahmni components.

# Update process


Note: A vagrant box can be converted to an 'ordinary' Virtual Box image removing the need to have a local vagrant installation at all.
