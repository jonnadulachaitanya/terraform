resource "aws_instance" "expense-1" {
    count = lenght(var.instance_names)
    ami = data.aws_ami.expense1.id
    instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro" 
    vpc_security_group_ids = [aws_security_group.expense1_sg.id]

    tags = merge (
        var.common_tags,
    {
        Name = var.instance_names[count.index]
    }
    )
}

resource "aws_security_group" "expense1_sg" {
    name = "allow_ssh"
    description = "we are enabling port no 22 for ssh"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        
    }

    tags = merge (
        var.common_tags,
        {
            Name = "allow_ssh"
        }
    )
}