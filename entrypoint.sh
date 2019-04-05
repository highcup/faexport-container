#!/bin/sh

#write cookie into settings for faexport
echo 'cookie: "'$COOKIE'"' > /faexport/settings.yml

#run the redis-server in the background
redis-server &

#run faexport and listen on all ips
bundle exec rackup config.ru -o 0.0.0.0