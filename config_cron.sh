#!/bin/bash

current_dir=$(pwd)
crontab -l > cron_temp

echo "*/2 * * * * /bin/bash ${current_dir}/main_script.sh >> ${current_dir}/cron.output 2>&1" > cron_temp
echo "setting cron job..."
crontab cron_temp
echo "done!"
rm cron_temp
echo "cron_temp removed!"