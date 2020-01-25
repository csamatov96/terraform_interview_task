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
    user_data = file("userdata_file.sh")



    tags = {
        Name = "HelloWorld"
    } 
}

