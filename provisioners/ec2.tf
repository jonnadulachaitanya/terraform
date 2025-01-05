resource "aws_instance" "terraform" {


    instance_type = "t3.micro"
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.terraform.id]

    tags = {
        Name = "terraform"
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.terraform.public_ip} > public.txt"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip

    }
# provisioner will execute at the time of creation
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",            
        ]
    }

}

resource "aws_security_group" "terraform" {
    name = "allow=ssh"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }
     ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        
    }

    tags = {
        Name = "allow-ssh"
    }
}