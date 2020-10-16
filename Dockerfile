FROM centos/python-36-centos7:latest

### -------------------------------------------------
### Metadata information
### -------------------------------------------------
LABEL name="FourSicks"
LABEL maintainer="andytnorwood@gmail.com"
LABEL description="network devops container"
LABEL license="GPLv2"
LABEL url="https://github.com/"
LABEL build-date="16102020"

### -------------------------------------------------
### Install system Packages
### -------------------------------------------------
USER root
RUN yum -y update 
RUN yum -y install nano nmap wget telnet zsh openssh-client
RUN yum clean all
RUN rm -rf /tmp/* /var/tmp/*

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
