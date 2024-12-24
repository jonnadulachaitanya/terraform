resource "aws_instance" "expense" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.expense.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.expense_sg.id]

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}

resource "aws_security_group" "expense_sg" {
  name        = "allow_ssh"
  description = "we are enabling port no 22 for ssh"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = merge(
    var.common_tags,
    {
      Name = "allow_ssh"
    }
  )
}




#if the environment is prod, create elastic search with t2.medium instance type otherwise create with t3.micro
resource "aws_instance" "elasticsearch" {
  ami = data.aws_ami.expense.id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.expense_sg.id]

  tags = {
    Name = "terraform"
  }

}