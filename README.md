# Blynk Server - Docker image
This is a simple Docker implementation of local [blynk-server](https://github.com/blynkkk/blynk-server). The ambition is to have easy to use Docker image, which allows to use existing configuration files, data, certificates and send e-mail notifications. If you running this for very first time, default configuration files will be automatically created for you.

## Installation

### Docker

```
$ docker run --name blynk-server -v /path-to-blynk-config:/config -v /path-to-blynk-data:/data -v /path-to-blynk-certificates:/ssl -p 8440:8440 -p 8080:8080 -p 9443:9443 -d valkodev/blynk-server:latest
```
### Docker Compose

```yml
version: "2.4"
services:
  blynk-server:
    image: valkodev/blynk-server:latest
    container_name: blynk-server
    volumes:
      - /path-to-blynk-config:/config     # local server configuration files
      - /path-to-blynk-data:/data         # local server data
      - /path-to-blynk-certificates:/ssl  # optional - for custom SSL certificates
    ports:
      - 8080:8080       # plain TCP connection for hardware on the Local Server (no security)
      - 8440:8440       # hardware mqtt port
      - 9443:9443       # SSL/TLS connection for the Mobile Apps on the Local Server and hardware with SSL  
    restart: unless-stopped
 ``` 
## Configuration
### configuration values

| Parameter | Function |
| :----: | --- |
| `-p 8080` | plain TCP connection for hardware on the Local Server (no security) |
| `-p 8440` | hardware mqtt port |
| `-p 9443` | SSL/TLS connection for the Mobile Apps on the Local Server and hardware with SSL  |
| `-v /config` | Local Server configuration files |
| `-v /data` | Local Server data |
| `-v /ssl` | optional - for custom SSL certificates |

## Support Info

* Shell access whilst the container is running: `docker exec -it blynk-server /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f blynk-server`

