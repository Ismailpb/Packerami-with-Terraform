#================================================
#       AMI selction
#================================================


data "aws_ami" "my_image" {
  
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["linux-demo-app"]
  }

}

resource "aws_key_pair"  "key" {
 
  key_name   = "terraform"
  public_key = file("terraform.pub")

}

# =====================================================
# Creating Ec2 Instance
# =====================================================

resource "aws_instance"  "webserver" {
    
  ami                          =  data.aws_ami.my_image.id
  instance_type                =  var.type
  subnet_id                    =  ""
  key_name                     =  aws_key_pair.key.id
  vpc_security_group_ids       = [ "sg-05aa64c930163b649" ]

  tags     = {
    Name    = "webserver"
  }
           lifecycle {
    create_before_destroy = true
  }    
}
