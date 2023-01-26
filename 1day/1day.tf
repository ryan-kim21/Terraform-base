provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "intro" {
  ami               = "ami-035233c9da2fabf52"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2"
  key_name          = "Project2022"

  vpc_security_group_ids = ["sg-0a953be8a45e2eb72"]
  tags = {
    name = "tf-instance"
    project ="dev"
  }

}
