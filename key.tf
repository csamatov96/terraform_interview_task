
resource "aws_key_pair" "terraform_workstation" {
  key_name   = "terraform_workstation"
  public_key = file("~/.ssh/id_rsa.pub")
}
