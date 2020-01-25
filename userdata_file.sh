#!/bin/bash
"sudo yum update -y",
"sudo yum install httpd -y",
"sudo service httpd start",
"sudo chkconfig httpd on",
"echo “HELLO WORLD” > /var/www/html/index.html",
"echo “HELLO WORLD from $(hostname -f)” > /var/www/html/index.html"
