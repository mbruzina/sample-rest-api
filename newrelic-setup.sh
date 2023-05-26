#!/bin/bash

# install utilities
sudo apt-get -y install unzip

# download java agent
curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip

unzip newrelic-java.zip
mv newrelic sample-rest-api/.newrelic
