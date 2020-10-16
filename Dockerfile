FROM centos/python-36-centos7:latest

### -------------------------------------------------
### Metadata information
### -------------------------------------------------
LABEL name="dalmasca"
LABEL maintainer="packetferret@gmail.com"
LABEL description="network devops container"
LABEL license="GPLv2"
LABEL url="https://github.com/packetferret/dalmasca"
LABEL build-date="20200201"

### -------------------------------------------------
### Install system Packages
### -------------------------------------------------
USER root
RUN apt update 
RUN apt upgrade -y
RUN apt install nano nmap wget python3 python3-pip telnet zsh openssh-client -y
RUN apt autoremove

### -------------------------------------------------
### Change directory to /home/tmp
### -------------------------------------------------
WORKDIR /home/tmp/files

### -------------------------------------------------
### Add and install python packages
### -------------------------------------------------
ADD config/requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

### -------------------------------------------------
### Install Ansible Galaxy roles
### -------------------------------------------------
RUN ansible-galaxy collection install cisco.ios

### -------------------------------------------------
### Copy local files to container
### -------------------------------------------------


### -------------------------------------------------
### Change directory to /opt/app-root/src/ansible
### -------------------------------------------------
WORKDIR /opt/app-root/src/ansible

### -------------------------------------------------
### Environmentals
### -------------------------------------------------
ENV HAPPY True
ENV ANSIBLE_CONFIG /opt/app-root/src/ansible/ansible.cfg
