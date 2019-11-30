#! /bin/bash
# create tomcat/mysql VM for deployment of web app

# [START script]
set -v

# Talk to the metadata server to get the project id
#PROJECTID=$(curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")
#BUCKET=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/BUCKET" -H "Metadata-Flavor: Google")

PROJECTID=WebApplication-213918
BUCKET=bucket1223
echo "Project ID: ${PROJECTID}  Bucket: ${BUCKET}"

# get our file(s)
gsutil cp "gs://bucket1223/tomcat-mysql/"** .

# Install dependencies from apt
apt-get update
apt-get install -t stretch-backports -yq openjdk-8-jdk

# Make Java8 the default
update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

cat << EOF >> ~/.bashrc
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export JAVA_HOME
CATALINA_HOME=/opt/tomcat
export CATALINA_HOME
PATH=$JAVA_HOME:/bin:$PATH
export PATH
EOF

source ~/.bashrc

####### tomcat Setup

# Get tomcat
if [ ! -d /opt/tomcat ]
then
	mkdir -p /opt/tomcat
	cd /opt
	wget http://mirror.dsrg.utoronto.ca/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz
	tar xf apache-tomcat-8.5.32.tar.gz  --strip-components=1 -C /opt/tomcat

	# Add a tomcat Userwd
	groupadd tomcat
	useradd --gid tomcat --shell /bin/false --home-dir /opt/tomcat tomcat

	# Make sure "tomcat" owns everything.
	chown --recursive tomcat:tomcat /opt/tomcat
	chmod +x tomcat/bin/*

# Add tomcat in systemd and auto start
echo "Add tomcat into auto start"
cat << EOF > /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat 8 Servlet Container
After=syslog.target network.target

[Service]
Type=forking
Environment="JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre"
Environment="PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:/opt/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Environment="CATALINA_PID=/opt/tomcat/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
Restart=on-failure

WorkingDirectory=/opt/tomcat
User=tomcat
Group=tomcat

[Install]
WantedBy=multi-user.target
EOF

fi

systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

# Install logging monitor. The monitor will automatically pickup logs sent to syslog.
curl -s "https://storage.googleapis.com/signals-agents/logging/google-fluentd-install.sh" | bash
service google-fluentd restart &

echo "Startup Complete"
# [END script]

