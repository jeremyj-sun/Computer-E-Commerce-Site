
@echo off

echo "copy startup script to cloud storage"
call gsutil cp -r tomcat-mysql/* gs://bucket1223/tomcat-mysql/

echo "create firewall rule"
call gcloud compute firewall-rules create allow-tomcat-mysql --allow tcp:8080 --source-ranges 0.0.0.0/0 --target-tags tomcat-mysql --description "Allow port 8080 and 3306 access to instances tagged with tomcat-mysql"

echo "create VM"
call gcloud compute instances create my-tomcat-mysql --machine-type=g1-small --scopes="datastore,userinfo-email,logging-write,storage-full,cloud-platform" --metadata-from-file startup-script=tomcat-mysql\startup-tomcat-mysql.sh --zone=us-central1-c --tags=tomcat-mysql --image-family=debian-9 --image-project=debian-cloud --metadata BUCKET=bucket1223
  
