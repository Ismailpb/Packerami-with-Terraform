############################################# Variable declaration Section #############################################
variable "ami_name" {
  type    = string
  default = "linux-demo-app"
}

variable "access_key" {
  type    = string
  default = "XXXXXXXXXXXXXXx"
}

variable "secret_key" {
  type    = string
  default = "YYYYYYYYYYYYYYYYYYYYY"
}

############################################# Image creation Section #############################################

source "amazon-ebs" "Webserver-VM" {
  ami_name                    = "${var.ami_name}"
  access_key                  = "${var.access_key}"
  secret_key                  = "${var.secret_key}"
  region                      = "ap-south-1"
  instance_type               = "t2.micro"
  source_ami                  = "ami-052cef05d01020f1d"
  associate_public_ip_address = true

}

build {

  name = "linux-ami"
  source "source.amazon-ebs.Webserver-VM" {
    ssh_username = "ec2-user"
  }

  provisioner "shell" {
    script = "user.sh"

  }

}
