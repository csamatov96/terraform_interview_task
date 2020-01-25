data "aws_ami" "centos" { #
    filter { 
        name = "root-device-type" 
        values = ["ebs"] #instance_store  
        } 
    most_recent = true 
    owners = ["556116077166"] 
} 

#show the AMI id 
output "ami" { 
    value = "${data.aws_ami.centos.id}" 
} 

resource "aws_instance" "web" {
    ami           = "${data.aws_ami.centos.id}"
    instance_type = "t2.micro"
    security_groups = ["allow_http_https"]

    provisioner "remote-exec" {
    connection {
      host = self.public_ip
      type = "ssh"
      user = "centos"
      private_key = "~/.ssh/id_rsa"
      }
      inline = [
        "sudo yum update -y",
        "sudo yum install httpd -y",
        "sudo service httpd start",
        "sudo chkconfig httpd on",
        "echo “HELLO WORLD” > /var/www/html/index.html",
        "echo “HELLO WORLD from $(hostname -f)” > /var/www/html/index.html"
        ]
  }


    tags = {
        Name = "HelloWorld"
    } 
}

