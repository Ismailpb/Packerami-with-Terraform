#!/bin/bash

sudo yum install httpd git -y

sudo systemctl restart httpd.service
sudo systemctl enable httpd.service

cd /
sudo git clone https://github.com/Ismailpb/support.git
sudo cp -pr support/* /var/www/html
sudo chown -R apache. /var/www/html/

sudo systemctl restart httpd.service
