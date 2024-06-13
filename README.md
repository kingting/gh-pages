
# Docker Quick Start Guide

## Introduction

This quick start guide provides the basic Docker commands to help you get started with understanding and using Docker. By following this guide, you will learn how to build, tag, push, and manage Docker images and containers. You can actually run the commands in the examples after cloning this repository.

## Build the Image
```bash
docker build -t <image_name>:<tag> .
```
Example:
```bash
docker build -t myapp:latest .
```

## Tag the Image
```bash
docker tag <image_name>:<tag> <registry_url>/<namespace>/<image_name>:<tag>
```
Example:
```bash
docker tag myapp:latest myregistrydomain.com/myrepo/myapp:latest
```

## Push the Image to a Registry
```bash
docker push <registry_url>/<namespace>/<image_name>:<tag>
```
Example:
```bash
docker push myregistrydomain.com/myrepo/myapp:latest
```

## Run a Shell in the Container
```bash
docker run -it <image_name> /bin/bash
```
Example:
```bash
docker run -it myapp:latest /bin/bash
```

## Install Docker Registry in a Locked-Down Machine
### Pull the Registry Image
```bash
docker pull registry:2
```

### Save the Registry Image to a Tar File
```bash
docker save -o registry.tar registry:2
```

### Load the Registry Image from a Tar File
```bash
docker load -i registry.tar
```

### Run the Registry Container
```bash
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

## List All Containers (Running and Stopped)
```bash
docker ps -a
```

## List Running Containers
```bash
docker ps
```

## Stop a Running Container
```bash
docker stop <container_id>
```
Example:
```bash
docker stop my_container
```

## Remove a Stopped Container
```bash
docker rm <container_id>
```
Example:
```bash
docker rm my_container
```

## Remove an Image
```bash
docker rmi <image_name>:<tag>
```
Example:
```bash
docker rmi myapp:latest
```

## View Logs of a Container
```bash
docker logs <container_id>
```
Example:
```bash
docker logs my_container
```

## Execute a Command in a Running Container
```bash
docker exec -it <container_id> <command>
```
Example:
```bash
docker exec -it my_container /bin/bash
```

## View Docker System Information
```bash
docker info
```

## Prune Unused Docker Objects
```bash
docker system prune
```

## Remove All Docker Images
```bash
# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)
```

### Notes

- `<image_name>`: Name of the Docker image.
- `<tag>`: Tag of the Docker image, often a version number (default is `latest`).
- `<container_id>`: ID or name of the Docker container.
- `<registry_url>`: URL of the Docker registry (e.g., `myregistrydomain.com`).
- `<namespace>`: Namespace in the registry (e.g., `myrepo`).
- `<host_port>`: Port on the host machine.
- `<container_port>`: Port inside the Docker container.
- `<output_file>`: Name of the tar file to save the image.
- `<input_file>`: Name of the tar file to load the image from.
