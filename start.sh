#!/bin/sh

# Enable logging to Monitrix (ELK):
if [ "$MONITRIX_ENABLED" ]; then
    echo Attempting to send logs to Monitrix
    filebeat -v -e -c /etc/filebeat/filebeat.yml & 
else
	echo Monitrix crawl logging disabled
fi

# And fire it up:
./h3-bin/bin/heritrix -a heritrix:heritrix -b 0.0.0.0 -j /jobs
