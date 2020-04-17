#!/usr/bin/env bash

# Ensure the log file exists
touch /var/log/crontab.log

# Added a cronjob in a new crontab
echo "5 * * * * curator --config=/etc/curator/curator.yml /etc/curator/actions/allocate_and_delete.yml" > /etc/crontab

# Registering the new crontab
crontab /etc/crontab

# Starting the cron
/usr/sbin/service cron start

# Displaying logs
# Useful when executing docker-compose logs mycron
tail -f /var/log/crontab.log
