#!/usr/bin/env bash

# Added a cronjob in a new crontab
echo "* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/create_index.yml >> /curator/curator.log 2>&1
# create index every minute
#* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/allocate_fast.yml >> /curator/curator.log 2>&1
# just empty line
#* * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/allocate_slow.yml >> /curator/curator.log 2>&1
# just empty line
*/2 * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/index_settings_fast.yml >> /curator/curator.log 2>&1
# allocate index to nodes with attribute fast
*/3 * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/index_settings_slow.yml >> /curator/curator.log 2>&1
# allocate index to nodes with attribute slow
*/5 * * * * /opt/bitnami/python/bin/curator --config=/curator/curator.yml /curator/actions/delete_index.yml >> /curator/curator.log 2>&1
# delete indexes older than 5 minutes" > /etc/crontab

# Registering the new crontab
crontab /etc/crontab

# Starting the cron
/usr/sbin/service cron start
