FROM openjdk:11-jre

MAINTAINER Radek Válko <rvalko@gmail.com>

# Blynk Server JAR version
ENV BLYNK_SERVER_VERSION 0.41.14

#hardware mqtt port
ENV HARDWARE_MQTT_PORT 8440
#http, plain web sockets and plain hardware port
ENV HTTP_PORT 8080
#secured https, web sockets and app port
ENV HTTPS_PORT 9443

RUN mkdir -p /blynk
RUN curl -L https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/server-${BLYNK_SERVER_VERSION}.jar > /blynk/server.jar

RUN mkdir -p /data
RUN mkdir -p /config
RUN mkdir -p /ssl
RUN mkdir -p /tmp
ADD ./config /tmp

RUN mkdir -p /usr/local/bin
ADD ./bin /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

VOLUME ["/config", "/data", "/ssl"]

EXPOSE ${HARDWARE_MQTT_PORT} ${HARDWARE_MQTT_PORT_SSL} ${HTTP_PORT} ${HTTPS_PORT}

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/run.sh"]

