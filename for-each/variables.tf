variable "expense_instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    default = "Z07531171JTKXQEA9NV0O"
}

variable "domain_name" {
    default = "chaitanyaproject.online"
}