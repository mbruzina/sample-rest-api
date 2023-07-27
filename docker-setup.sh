#!/bin/bash
cd $HOME

# install java
sudo apt install -y default-jre

# clone repo & build executable jar
git clone https://github.com/mbruzina/sample-rest-api.git && \
cd sample-rest-api/ && \
./gradlew bootJar && \
./gradlew downloadNewrelic && \
./gradlew unzipNewrelic# or ./gradlew build for a war

# install docker dependencies and keys
sudo apt-get update && \
sudo apt-get install -y ca-certificates curl gnupg && \
sudo install -m 0755 -d /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# repo setup
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker and friends
sudo apt-get update && \
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# validate installation
sudo docker run hello-world

# build our sample-rest-api image
sudo docker build -t derp/sample-rest-api .

# run it
sudo docker run -p 8080:8080 derp/sample-rest-api

# generate traffic by curling api/hello
# curl http://localhost:8080/api/hello
