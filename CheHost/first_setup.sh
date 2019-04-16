#!/bin/bash -xe

CURRENT_DIR=$(dirname $0)

cd /tmp
apt update
apt install curl wget -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
apt install docker-compose -y

mkdir -p /var/lib/che
cd ${CURRENT_DIR}
echo ${CURRENT_DIR}
pwd
docker-compose up
