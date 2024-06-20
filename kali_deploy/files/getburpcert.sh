#!/bin/bash
# Thanks to ippsec for this script!
# https://github.com/IppSec/parrot-build
/bin/bash -c "timeout 45 /usr/lib/jvm/java-21-openjdk-amd64/bin/java -Djava.awt.headless=true -jar /usr/share/burpsuite/burpsuite.jar < <(echo y) &" 
sleep 30
curl http://localhost:8080/cert -o /tmp/cacert.der
exit
