# Icecast with SSL


![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/madalozzo/docker-icecast/ci.yml)
[![DockerHub](https://img.shields.io/badge/Dockerhub-madalozzo/icecast2-blue?logo=docker&style=flat)](https://hub.docker.com/r/madalozzo/icecast2)
[![Docker Pulls](https://img.shields.io/docker/pulls/madalozzo/icecast2)](https://hub.docker.com/r/madalozzo/icecast2)
[![Docker Image Size](https://img.shields.io/docker/image-size/madalozzo/icecast2)](https://hub.docker.com/r/madalozzo/icecast2)

This repository contains scripts and configurations for managing SSL/TLS certificates and deploying an Icecast server using Docker.

## Usage
Prerequisites:
- A domain name pointing to your server.
- Docker and Docker Compose installed on your server.
- Port 80 open, for Let's Encrypt certificate generation.
- Ports 8000 (HTTP) and 8443 (HTTPS) open on your server (or the ports you choose to use).


```bash
#Create a directory for the Icecast server:
mkdir icecast
cd icecast

#Download the files to your server:
wget https://raw.githubusercontent.com/madalozzo/docker-icecast/refs/heads/main/create-certs.sh
wget https://raw.githubusercontent.com/madalozzo/docker-icecast/refs/heads/main/docker-compose.yml
wget https://raw.githubusercontent.com/madalozzo/docker-icecast/refs/heads/main/icecast.xml
chmod +x create-certs.sh

```

## Generate SSL/TLS certificates:
Edit the `create-certs.sh` script and set the `DOMAIN` variable to your domain name and adjust paths if necessary.
```bash
./create-certs.sh
```
Add the following line to your crontab to renew the certificates automatically:
```bash
45 4 * * 2 /home/ubuntu/icecast/create-certs.sh > /home/ubuntu/icecast/create-certs.log 2>&1
```

## Edit the Icecast configuration:
 - Edit passwords
 - Edit the `icecast.xml` file and set the `hostname` attribute in the `<hostname>` element to your domain name.
 - Edit ports if necessary.

## Start the Icecast server:
```bash
docker compose up -d
```

## Access the Icecast server:
- Open your browser and go to `https://your-domain.com:8443` to access the Icecast server.
- Use the `source` password to connect your streaming software to the Icecast server.

# License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
