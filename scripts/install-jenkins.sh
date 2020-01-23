#!/bin/sh

java -version

echo .

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo add-apt-repository universe

sudo apt-get update

sudo apt-get install jenkins -y

SECRET_FILE=/var/lib/jenkins/secrets/initialAdminPassword
if [ -f $SECRET_FILE ];
then
    sudo ls -l $SECRET_FILE
    sudo cat $SECRET_FILE
fi
