# Steps for Automating the provisioning of two Ubuntu-based servers, “Master” and “Slave”, using Vagrant.

Steps I followed to set up virtual machines (VMs) using Vagrant for my development environment:

- I created a script using "nano" named vagrant-master-slave.sh to automate the creation and configuration of the VMs. 
- The script initializes two VMs: one acting as a master and the other as a slave, running Ubuntu Focal Fossa (20.04 LTS).
- Save the script as vagrant-master-slave.sh
-  Make it executable by running this command `chmod +x vagrant-master.sh`
- Execute the script with this command `./vagrant-master.sh`

