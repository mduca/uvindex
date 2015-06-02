#! /bin/bash

name='uvindex'

if [ -f /var/www/$name/tmp/pids/unicorn.pid ]
  then
    pid=`cat /var/www/$name/tmp/pids/unicorn.pid`
    echo "Already running: $pid"; 
  else
    unicorn --include /var/www/$name -c /var/www/$name/config/unicorn.rb -E development -D;
    pid=`cat /var/www/$name/tmp/pids/unicorn.pid`;
    echo "Unicorn started: $pid";
fi
