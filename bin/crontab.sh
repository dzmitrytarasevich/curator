#!/usr/bin/env bash

# Added a cronjob in a new crontab
echo "*/5 * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/allocate_and_delete.yml >> /curator/curator.log 2>&1
# just empty line" > /etc/crontab

# Registering the new crontab
crontab /etc/crontab

# Starting the cron
/usr/sbin/service cron start
