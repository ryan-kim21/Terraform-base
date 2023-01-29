resource "aws_instance" "devops-test" {
    ami = var.AMIS[var.REGION] //가져오기
    instance_type = "t2.micro"
    abailability_zone = var.ZONE1
    key_name          = "Project2022"

    vpc_security_group_ids = ["sg-0a953be8a45e2eb72"]
    tags = {
        name = "tf-instance"
        project ="dev"
      }

    }

}

