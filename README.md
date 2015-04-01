# rpi-openhab2-snapshot

Raspberry Pi compatible Docker image with Mosquito (an MQTT server) installed.

### Build Details
- [Source Project Page](https://github.com/vlabakje)
- [Source Repository](https://github.com/vlabakje/rpi-mqtt)
- [Dockerfile](https://github.com/vlabakje/rpi-mqtt/blob/master/Dockerfile)
- [DockerHub] (https://registry.hub.docker.com/u/vlabakje/rpi-mqtt/)


#### Build the Docker Image
```bash
make build
```

#### Run the Docker Image
```bash
docker run -d --net=host vlabakje/rpi-openhab2-snapshot
```
This will expose port 8080 to which you can connect your clients.

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```


