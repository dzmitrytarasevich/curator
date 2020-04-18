#!/bin/bash

set -e

echo 'push me to the registry'

docker save "$JOB_BASE_NAME" -o "$JOB_BASE_NAME"
#docker tag "$JOB_BASE_NAME":latest 192.168.1.54/vagrant/vagrant:curator
#docker push 192.168.1.54/vagrant/vagrant:curator
yum install -y sshpass
sshpass -p "vagrant" scp "$JOB_BASE_NAME" vagrant@192.168.1.54:/home/vagrant
