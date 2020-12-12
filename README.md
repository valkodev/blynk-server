# Blynk server - Docker image

## Installation

### Docker
```
$ docker run --name blynk-server -v /path-to-blynk-config:/config -v /path-to-blynk-data:/data -v /path-to-blynk-certificates:/ssl -p 8440:8440 -p 8080:8080 -p 9443:9443 -d blynk-server:latest
```
### Docker Compose
```
version: "2.4"
services:
  blynk-server:
    image: blynk-server:latest
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
### Environment variables
