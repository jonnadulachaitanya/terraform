resource "aws_security_group" "dynamic_sg" {
    name = "dynamic_demo"
  

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

     dynamic "ingress" {          #terraform will give us a variable with block name(ingress in this block)
        for_each = var.ingress_rules
        content {
            from_port = ingress.value["from_port"] #or ingress.value.from_port
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
        
    }

    tags = {
        Name = "allow-ssh"
    }
}

