# Docker Image

## Install Docker

Set up the APT repo:

```bash
# Prepare APT for installs
sudo apt-get update

# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set-up the repository
echo \
"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] \
     https://download.docker.com/linux/ubuntu \
     "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
```

Install the packages:

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Augment current user to not require sudo for docker (not secure!)

```
sudo usermod -aG docker $USER
newgrp docker
```

## Build Docker Image

Fetch a sample application:

```
sudo apt install git
git clone https://github.com/tpszigeti/webapp
cd webapp
```

Build the Docker image:

```
docker build -t tszigeti/brketi-1004:web-app .
docker inspect image tszigeti/brketi-1004:web-app
docker image ls
```

Publish the Docker Image:

```
docker login
docker image push tszigeti/brketi-1004:web-app
```

Image Management:

```
docker image rm tszigeti/brketi-1004:web-app
docker image prune -a
docker image pull tszigeti/brketi-1004:web-app
```

Run the container:

```
docker run -d --name web-app -p  80:8080 tszigeti/brketi-1004:web-app
docker container ls
docker container stop web-app
docker container ls
docker container ls -a
docker container start web-app
```

Get instance details from setup and connect to the web server hosted by web-app
