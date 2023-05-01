baseline -userdata
======================
#!/bin/bash
yum update -y 
yum install telnet nc net-tools -y 
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent

apache
===========
#!/bin/bash
yum update -y 
yum install telnet nc net-tools httpd -y 
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent
systemctl start httpd 
systemctl enable httpd 


#prometheus
https://github.com/sivaram2662/prometheus-grafana

how to make golden AMI:
--------------------------
#!/bin/bash
yum update -y 
yum install telnet nc net-tools httpd -y 
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent
#exporter
cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0-rc.0/node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
 tar -zvxf node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
 cd node_exporter-1.4.0-rc.0.linux-amd64/

nohup ./node_exporter &





#ES userdata
#!/bin/bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.7.0-linux-x86_64.tar.gz
tar -xzf elasticsearch-8.7.0-linux-x86_64.tar.gz

cd elasticsearch-8.7.0/ 



#golden ami
#!/bin/bash
yum update -y 
yum install telnet nc net-tools httpd -y 
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent
cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0-rc.0/node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
 tar -zvxf node_exporter-1.4.0-rc.0.linux-amd64.tar.gz
 cd node_exporter-1.4.0-rc.0.linux-amd64/
nohup ./node_exporter &


#kibana
#!/bin/bashj
curl -O https://artifacts.elastic.co/downloads/kibana/kibana-8.7.0-linux-x86_64.tar.gz
curl https://artifacts.elastic.co/downloads/kibana/kibana-8.7.0-linux-x86_64.tar.gz.sha512 | shasum -a 512 -c - 
tar -xzf kibana-8.7.0-linux-x86_64.tar.gz
cd kibana-8.7.0/ 

#ci-shell-script
#!/bin/bash
echo "--->Delete the folder"
rm -fr apache-static-code
echo "--->clone the folder"
git clone git@github.com:Jayachandra-2/apache-static-code.git
echo "--->Switch to folder"
cd apache-static-code 
echo "--->pkg"
tar -cvzf static-1.tgz *
echo "--->upload to s3"
aws s3 cp static-1.tgz s3://artifacts-devops-learn/

#CD
#!/bin/bash
alias e=echo
mkdir apache-deployment
cd apache-deployment
echo "--->download artifact from aritfactory"
aws s3 cp s3://artifacts-devops-learn/static-1.tgz .
echo "--->extract the pkg"
tar -xvzf static-1.tgz
echo "--->deployment to apache"
cp index.html /var/www/html/









