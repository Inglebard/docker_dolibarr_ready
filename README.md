# Docker image inglebard/dolibarr_ready
Dolibarr container ready
[Github](https://github.com/Inglebard/docker_dolibarr_ready/tree/9)
[Dockerhub](https://hub.docker.com/r/inglebard/dolibarr_ready)

## Why use this image :

This image contains the php requirements to run dolibarr. Dolibarr must be downloaded manually.

## Technical information :

### Softwares :
* php (with apache)

### Ports :
* 80

### Volumes :
You may need to mount app folder to /var/www/html.

## How to use this image :
```
docker run -it --rm  -p 80:80 -v dolibarr_app:/var/www/html inglebard/dolibarr_ready:latest

```

Or use the docker-compose.yml file example

## Note :

The dolibarr files must be downloaded manually and the permissions must be done inside the container.
Tested with dolibarr 9.
