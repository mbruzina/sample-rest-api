#!/bin/bash

# create unprivileged user
sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat

# install java
sudo apt update && sudo apt install -y  default-jdk

# download tomcat
cd /tmp && \
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz && \
sudo tar xzvf apache-tomcat-10*tar.gz -C /opt/tomcat --strip-components=1

# change permissions
sudo chown -R tomcat:tomcat /opt/tomcat/ && \
sudo chmod -R u+x /opt/tomcat/bin

# update ui users
sudo vi /opt/tomcat/conf/tomcat-users.xml

######
# paste this at the bottom of the file, but within `</tomcat-users>` element
######

#  <role rolename="manager-gui" />
#  <user username="manager" password="password" roles="manager-gui" />
#
#  <role rolename="admin-gui" />
#  <user username="admin" password="password" roles="manager-gui,admin-gui" />

# remove manager page restriction from manager and host manager
# comment out <Valve element from these two files
sudo vi /opt/tomcat/webapps/manager/META-INF/context.xml
sudo vi /opt/tomcat/webapps/host-manager/META-INF/context.xml

# create systemd service
# store path created from this command i.e. /usr/lib/jvm/java-1.11.0-openjdk-amd64
sudo update-java-alternatives -l

# create tomcat.service definition
sudo vi /etc/systemd/system/tomcat.service

############
# paste the following, note java home is the path you found above
############

#[Unit]
#Description=Tomcat
#After=network.target
#
#[Service]
#Type=forking
#
#User=tomcat
#Group=tomcat
#
#Environment="JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64"
#Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
#Environment="CATALINA_BASE=/opt/tomcat"
#Environment="CATALINA_HOME=/opt/tomcat"
#Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
#Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
#
#ExecStart=/opt/tomcat/bin/startup.sh
#ExecStop=/opt/tomcat/bin/shutdown.sh
#
#RestartSec=10
#Restart=always
#
#[Install]
#WantedBy=multi-user.target

# reload systemd and start our tomcat service
sudo systemctl daemon-reload && \
sudo systemctl start tomcat && \
sudo systemctl enable tomcat

# unblock traffic on 8080; should see refs to `tomcat.apache.org` in
sudo ufw allow 8080 && curl -x http://localhost:8080
