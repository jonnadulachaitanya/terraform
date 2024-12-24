variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
    type = string

}
variable "instance_type" {
    default = "t3.micro"
    type = string
}

variable "tags" {
    type =map
    default = {
        Name = "terraform"
        Environment = "Development"
        terraform = "true"
        project = "expense"
        component = "backend"
    }
}

variable "sg_name" {
    default = "allow_ssh"
    type = string

}

variable "sg_tags" {
    type = map
    default = {
        Name = "allow_ssh"
        Environment = "development"
    }
}

variable "description" {
    default = "port 22 for accessing ssh"
    type = string
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    default = "22"
    type =  number
}

variable "protocol" {
    default = "tcp"
    type = string
}

variable "ingress_cidr_blocks" {
    default = ["0.0.0.0/0"]
    type = list(string)

}

variable "ingress_ipv6_cidr_blocks" {
    default = ["::/0"]
    type = list(string)
}