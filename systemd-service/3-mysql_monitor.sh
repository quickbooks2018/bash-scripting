#!/bin/bash
# Purpose: Monitoring
# quick installation
# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -v mysql_data:/var/lib/mysql -d mysql:latest


# check service mysql service is running or not
netstat -ant | grep :3306 | grep -i listen 1> /dev/null

mysql_status="$?"

if [ "$mysql_status" != "0" ]
then
  echo "Service is Down"
  echo "Starting mysql service"
  docker start mysql
else
  echo "Service is running fine"
fi
# End