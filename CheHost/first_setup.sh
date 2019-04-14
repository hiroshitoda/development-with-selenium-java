#!/bin/bash -xe

cd /tmp
apt update
apt install curl wget -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
apt install docker-compose

cd $(dirname $0)
docker-compose up
