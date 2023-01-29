resource "aws_key_pair" "devops-key"{
    key_name = "devops"
    public_key = file("devops.pub")


}


resource "aws_instance" "devops-test" {
    ami = var.AMIS[var.REGION] //가져오기
    instance_type = "t2.micro"
    abailability_zone = var.ZONE1
    key_name          = aws_key_pair.devops-key.key_name

    vpc_security_group_ids = ["sg-0a953be8a45e2eb72"]
    tags = {
        name = "tf-instance"
        project ="dev"
    }

    provisiner "file" {
        source = "web.sh"
        destination = "/tmp/web.sh"
    }

    provisiner "remote-exec" {
        inline = [
            "chmod u+x /tmp/web.sh",
            "sudo /tmp/web.sh"
        ]
    }

    connection {
        user = var.USER
        private_key = file("devops")
        host = self.public_ip
    }

}

