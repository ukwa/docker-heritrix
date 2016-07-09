#!/bin/sh

# Enable logging to Monitrix (ELK):
if [ "$MONITRIX_ENABLED" ]; then
    echo Attempting to send logs to Monitrix
    filebeat -v -e -c /etc/filebeat/filebeat.yml & 
else
	echo Monitrix crawl logging disabled
fi

#cd /bl-heritrix-modules
#mvn install -DskipTests
#cd /

# Unpack crawler:
#cp /heritrix3/contrib/target/heritrix-contrib-*.jar ./heritrix-3.3.0-SNAPSHOT/lib
#cp /bl-heritrix-modules/target/bl-heritrix-modules-*jar-with-dependencies.jar ./heritrix-3.3.0-SNAPSHOT/lib
cp /logging.properties /heritrix-3/conf/logging.properties

# And fire it up:
./heritrix-3/bin/heritrix -a heritrix:heritrix -b 0.0.0.0 -j /jobs
