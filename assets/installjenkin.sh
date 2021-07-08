#!/bin/bash
# Author : CAJECASU

set -ex


sudo apt update

sudo apt install -y default-jre


wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -


sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


sudo apt update


sudo apt install -y jenkins


sudo systemctl start jenkins

sudo systemctl status jenkins

sudo ufw allow 8080


sudo ufw status