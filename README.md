# SANDBOX DELIVERY ENVIRONMENT (WORK IN PROGRESS)
**JENKIN/NEXUS/DOCKER/KUBERNETES/MICROK8S OUT-OF-THE-BOX**

## Goal
The main goal is to create a virtualised environment that allows you an end-to-end delivery of your applications.

The installation can be done on any computer that runs at last VirtualBox 7. 

In the end you will have 2 running VMs that will provide different kind of popular services.

## Description
Using VirtualBox7, this guide will help you to setup your sandbox installation for 2 development units:

- DevOps tools for pipelines (integration and delivery)
- Applications runtime for deployment of your apps

| VM     | Service  | Description                                                                                     |
|--------|----------|-------------------------------------------------------------------------------------------------|
| DevOps | Jenkins  | Build tool. Can connect to control version repository or push container images.                 |
| DevOps | Nexus    | An open source repository that supports many artifact formats, including Docker, Java™, and npm.|
| Kube   | MicroK8s | Certified Kubernetes distribution                                                               |



## Requirements
The solution has been successfully tested on a `i7 3600Mhz dual-core / 4Gb of DDR3` with default values.

However, we suggest to review the values to recommended ones.

#### Memory recommendations

| VM     | Default | Recommended |
|--------|---------|-------------|
| DevOps | 2048MB  | 10GB        |
| Kube   | 1024MB  | 4Gb         |


#### Disk capacity
Depending on your needs, the disk capacity can be decreased or increased. 

The disk usage is dynamically allocated by the VM provider but keep in mind that you need at least much disk space as the sum of all the VM volumes disk sizes.

| VM     | Default | Minimal  |
|--------|---------|----------|
| DevOps | 50GB    | 25GB     |
| Kube   | 50GB    | 25GB     |


## Installation
### Manual or Automated

The manual folder will guide you to setup the environment yourself in an easy way but yet attended installation.

The automated folder will guide use to prepare an non-attended installation of your server using Vagrant software.

*Note that automated folder will depend on manual folder files as the process will follow the same sequence 
of instructions.*

# After installation

## Note about the domain name

Assuming you choose: 
```
internal.yourdomain.com
```
as your internal domain reference during the automated or manual
installation. 

## Hosts names
Think about changing your hosts file to create an alias on your host-machine.

Append this content in your hosts file:
```
127.0.0.1 internal.yourdomain.com
```
Assuming the VM host is your own machine, otherwise instead of 127.0.0.1 set the VM host machine IP.

### Edit hosts file on Windows
On Windows the file is located at :
```
C:\Windows\System32\drivers\etc
```
Using notepad (or equivalent) in administrator mode (copy a backup file before) change the content then save. 
No reload or reboot needed.


### Edit hosts file on Linux
On Linux the file is located at :
```
/etc/hosts
```
Using vi or nano (or equivalent) in sudo or su mode (copy a backup file before) change the content then save. 
No reload or reboot needed.

## Acess to deployed services

### DevOps

| Site       | Link resource                       |
|------------|-------------------------------------|
| Jenkins    | http://internal.yourdomain.com:9002 |
| Nexus      | http://internal.yourdomain.com:9003 |
| Docker-hub | http://internal.yourdomain.com:1100 |

### Kube

| Site          | Link resource                        |
|---------------|--------------------------------------|
| K8S-Dashboard | http://internal.yourdomain.com:10443 |
| hello-app     | http://internal.yourdomain.com:8080  |
