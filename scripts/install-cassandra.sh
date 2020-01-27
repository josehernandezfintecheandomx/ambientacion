#!/bin/sh

java -version

echo .

sudo apt install apt-transport-https -y

wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -

sudo sh -c 'echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list'

sudo apt-get update

sudo apt-get install cassandra -y

nodetool status
