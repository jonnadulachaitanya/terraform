resource "aws_instance" "expense" {

    for_each = var.expense_instances
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.expense_sg.id]
    tags ={
        Name = each.key
    }

}

resource "aws_security_group" "expense_sg" {
    name = "allow-ssh"
    description = "we are allowing port no 22"

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

    tags = {
        Name = "allow-ssh"
    }
}