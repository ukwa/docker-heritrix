#!/bin/sh
#
#

# Get the H3 LBS binary:
curl -L -O https://sbforge.org/nexus/service/local/repositories/thirdparty/content/org/archive/heritrix/heritrix/3.3.0-LBS-2016-02/heritrix-3.3.0-LBS-2016-02-dist.zip
unzip heritrix-3.3.0-LBS-2016-02-dist.zip
ln -s /heritrix-3.3.0-LBS-2016-02 /h3-bin
cp /logging.properties /h3-bin/conf/logging.properties

# Build BL modules
git clone https://github.com/ukwa/bl-heritrix-modules.git bl-heritrix-modules
cd /bl-heritrix-modules
mvn install -DskipTests
cd /

# And install module and it's dependencies:
cp /bl-heritrix-modules/target/bl-heritrix-modules-*jar-with-dependencies.jar ./h3-bin/lib
