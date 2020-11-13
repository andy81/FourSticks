FROM python:3.9-slim

### -------------------------------------------------
### Metadata information
### -------------------------------------------------
LABEL name="FourSicks"
LABEL maintainer="andytnorwood@gmail.com"
LABEL description="network devops container"
LABEL license="GPLv2"
LABEL url="https://github.com/"
LABEL build-date="12112020"

### -------------------------------------------------
### Install system Packages
### -------------------------------------------------
USER root
RUN apt update && apt upgrade -y
RUN apt install -y nano curl git nmap wget telnet zsh openssh-client fonts-powerline

### -------------------------------------------------
### Change directory to /home/tmp
### -------------------------------------------------
WORKDIR /home/tmp/files

### -------------------------------------------------
### Add and install python packages
### -------------------------------------------------
ADD config/requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install --upgrade pip

### -------------------------------------------------
### Install Ansible Galaxy roles
### -------------------------------------------------
RUN ansible-galaxy collection install cisco.ios netbox.netbox

### -------------------------------------------------
### Copy local files to container
### -------------------------------------------------


### -------------------------------------------------
### Change directory to /opt/app-root/src/ansible
### -------------------------------------------------


### -------------------------------------------------
### Environmentals
### -------------------------------------------------
ENV HAPPY True
