resource "aws_security_group" "expense_sg" {
    name = "allow_all"
    description = "we are enabling port 22 for expense project"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        Name = "allow_ssh"
    }
}


resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.expense_sg.id]

    tags = {
        Name = var.instance_names[count.index]
    }
}