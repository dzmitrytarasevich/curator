#!/usr/bin/env bash

# Added a cronjob in a new crontab
echo "* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/create_index.yml >> /curator/curator.log 2>&1
# just empty line
* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/allocate_fast.yml >> /curator/curator.log 2>&1
# just empty line
* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/allocate_slow.yml >> /curator/curator.log 2>&1
# just empty line
*/6 * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/delete_index.yml >> /curator/curator.log 2>&1
# just empty line" > /etc/crontab

# Registering the new crontab
crontab /etc/crontab

# Starting the cron
/usr/sbin/service cron start
