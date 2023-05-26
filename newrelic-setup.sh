#!/bin/bash
cd $HOME

# install utilities
sudo apt-get -y install unzip

# download java agent
curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip
unzip newrelic-java.zip

# move into project, just for testing
mv newrelic sample-rest-api/.newrelic
