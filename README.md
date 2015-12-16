# wellbody-config

Contains relevant customizations of Bahmni for the Wellbody Clinic in Sierra Leone. Currently the installation/update is not fully automised and requires some 'hand-crafting' steps on the target server.

In a nutshell the deployment
- does not make use of the default Bahmni installation process (via its RPM packages)
- requires a default PIH-EMR server environment (based on Ubuntu)
- uses 'binary' components (aka archives) of relevant Bahmni components
- the components can/need to be derived from a 'golden master' installation (either the Bahmni vagrant or docker environment with vagrant being used more recently).
- has no proper OpenMRS metadata handling; most important it doesn't create a DB instance from scratch, but requires the import of an initial OpenMRS MySQL dump 

The 'binary' components are not part of this github project, but the basic scripts to install a new and update an existing environment are included in the scripts-vagrant folder (the files under scripts-docker is currently not used/well tested).

Content:
- openmrs-configs: List of all metadata changes for Wellbody (originating from Bahmni's default OpenMRS DB)
- openmrs: Bahmni apps customization dir
- scripts-docker: Scripts to handle docker-based Bahmni installation (currently unmaintained)
- scripts-vagrant: Scripts for installing/updating Bahmni installation (doesn't not require a 'target' vagrant-based system)

# Initial installation

The script script-vagrant/install.sh contains the necessary steps to prepare a default PIH-EMR server environment for a Bahmni installation. As a default it expects the 'binary' Bahmni components in the directory ~/bahmni-dist. This script lacks testing and verification, so for now it should only be used as a documantational guide for someone who follows these individual lines to manually install Bahmni from a shell.

Note that a 'side-by-side' installation Bahmni in parallel to the PIH-EMR is currently not supported (clash of .OpenMRS dirs, webapp context paths, port overlaps, Apache HTTPS configs). This is nothing un-solveable, but wasn't pushed further yet. So before installing Bahmni, make sure that the PIH-EMR is not actively running (by shutting down its Tomcat process and also disabling its auto-start after boot).

Once the initial installation/preparation is done, continue with the Update process to get/update all 'binary' Bahmni components.

# Update process

Once the initial installation is completed, the runtime components of Bahmni can be installed and updated via the script script-vagrant/update.sh. Unlike the above install.sh this script is better tested and used with the current live installation of Bahmni for Wellbody. However it can still make sense for someone doing this for the first time, to look at the script and manually enter the command in a shell to make sure that unwanted sideeffects are avoided and all paths match. Similar to the install.sh it also expects the 'binary' Bahmni components in the folder ~/bahmni-dist (or ~/b).

After a successful install and update, Bahmni should be up and running with these components:
- Bahmni: http:/<server>:/bahmni/home
- OpenMRS: http:<server>:8080/openmrs
- Bahmni reports: http:<server>:8080/bahmnireports
- MySQL db instance: openmrs_bahmni at localhost

# Creating 'binary' Bahmni components

The 'binary' components to install and update a Bahmni environment are derived from a 'golden master' installation. This is based on the published Bahmni vagrant box and packages the necessary parts in various files/archives, so that the scripts install.sh and update.sh can make use of the binary Bahmni distribution. After execution of the script script-vagrant/package-bahmni.sh these files/archives are created in the folder ./bahmni-dist-temp. From there they can be transferred to target server. 

When network bandwidth is an issue consider rsync similar to script-vagrant/transfer-bahmni.sh to speed up the process.

Note: A vagrant box can be converted to an 'ordinary' Virtual Box image removing the need to have a local vagrant installation at all. Adding a few port forwards (e.g. 22, 80, 8080, 443) to the Virtual Box environment it behaves very similar to an external server.
