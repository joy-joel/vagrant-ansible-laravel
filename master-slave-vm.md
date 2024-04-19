# Steps for Automating the provisioning of two Ubuntu-based servers, “Master” and “Slave”, using Vagrant.

Steps I followed to set up virtual machines (VMs) using Vagrant for my development environment:

## Step 1:
- I created a script using "nano" named *vagrant-master-slave.sh* to automate the creation and configuration of the VMs. 
- The script initializes two VMs: one acting as a master and the other as a slave, running Ubuntu Focal Fossa (20.04 LTS).
- Save the script as vagrant-master-slave.sh
-  Make it executable by running this command `chmod +x vagrant-master-slave.sh`

## Step 2: Running vagrant-master-slave.sh Script:
- I ran the vagrant-master-slave.sh script in my terminal with this command `./vagrant-master.sh`. This script will automate the setup process by creating a Vagrantfile with the configurations for the VMs.

## Step 3: Creating,Initializing the Vagrantfile:
- The script will generate a Vagrantfile with configurations for both the master and slave VMs, also initialize the VMs by running `vagrant up` defined at the end bash script. It specified the hostname, base box, private network settings, provisioning scripts, and provider settings for each VM. 

## Step 4: Accessing the VMs:

Once the VMs were initialized and provisioned, I accessed them using SSH. I utilized the vagrant ssh command to SSH into each VM and verified that they were configured correctly.

### To see images of this task:
- check images\master-slave-vagrant folder/directory.