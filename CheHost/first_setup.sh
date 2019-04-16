#!/bin/bash -xe

cd $(dirname $0)
CURRENT_DIR=$(pwd)

cd /tmp
apt update
apt install curl wget -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
apt install docker-compose -y

mkdir -p /var/lib/che
cd ${CURRENT_DIR}
echo ${CURRENT_DIR}
docker-compose up
