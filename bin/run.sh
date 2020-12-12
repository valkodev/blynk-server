#!/bin/bash

# if server.properties doesn't exist in /config we will copy defaults from /tmp
[ ! -f /config/server.properties ] && cp /tmp/server.properties /config/server.properties

# if mail.properties doesn't exist in /config we will copy defaults from /tmp
[ ! -f /config/mail.properties ] && cp /tmp/mail.properties /config/mail.properties

# start Blynks server
java -jar /blynk/server.jar -dataFolder /data -serverConfig /config/server.properties -mailConfig /config/mail.properties
