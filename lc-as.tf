resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  #security_groups = ["allow_http_https"]
  #user_data = file("userdata_file.sh")
}

resource "aws_autoscaling_group" "example" {
  availability_zones = ["eu-west-3a"]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 3

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.example.id}"
      }

    }
  }
}