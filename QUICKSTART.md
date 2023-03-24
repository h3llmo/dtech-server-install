# QUICK-START

## Introduction note - warning

This quickstart guide will make you start the project with all the default values.
Bu sure to have at last **6GB** of free memory before and at-least 2-core CPU.

### You don't meet the requirements
Don't worry, you can downsize the requirements by chaning the [blueprint](./VagrantSandbox/blueprint.json) file. Be sure to set at leas 1GB of memory for each VM.

##  Install Virtual Box 7+

Go to [Virtual Box download page](https://www.virtualbox.org/wiki/Downloads) and get the las version.

After the download, proceed to installation

VirtualBox allows you to virtualise machines on your operating system and install softwares on-it (such as other operating systems) using a friendly-user interface.


__________________________________________________________________________________

## Install Vagrant 2.3.2+

Go to [Vagrant download page](https://developer.hashicorp.com/vagrant/downloads) and get the last version.

Vagrant is pilot for your VirtualBox, using scripted files you can automatise the installation of your virtual machine in VirtualBox. The is no interface for Vagrant but a CLI.

__________________________________________________________________________________

## Verify vagrant installation and add plugins

Open a command line console, and execute `vagrant --version`. 
You should see this (or an higher version).

 ```bash
 C:\Users\h3llm>vagrant --version
Vagrant 2.3.2
```

### Install vagrant plugins

As the installation of the servers allows you resize the machines, you will need the `vagrant-diskze` plugin.

```bash
vagrant plugin install vagrant-disksize
```

## Run and take a coffee

You are now ready to set-up your DevOps environment.

In a command-line tool, change directory to [VagrantSandbox](./VagrantSandbox/) and start provisioning VirtualBox:

```bash
vagrant up
```

That's it for your part, now let the installation run and take a coffee because, dependenging on your computer performances of course, we talking of a 20-30 minutes start to finish process.

Note that only at the first run, it will download an VM image (a box in Vagrant language) that will also take a bit of time. On next runs, it will reuse the files that have been already downloaded.
