#!/bin/bash
# Author : CAJECASU

set -ex


apt-get update
apt-get install -y default-jre


wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -


sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


apt update


apt install -y jenkins


systemctl start jenkins

systemctl status jenkins

ufw allow 8080


ufw status