#!/bin/bash
echo "=====SERVER HEALTH CHECK====="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "=====DISK USAGE====="
echo "Disk space: $(df -h)"
echo "=====MEMORY USAGE====="
echo "Memory: $(free -h)"
echo "===== RECENT NGINX LOGS====="
sudo journalctl -u nginx -n 10 --no-pager 
echo "=====NGINX STATUS====="
if systemctl is-active --quiet nginx
then
   echo "Nginx: Running"
else
   echo "Nginx: Down"
fi
