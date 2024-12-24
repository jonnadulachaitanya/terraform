locals {
    zone_id = "Z07531171JTKXQEA9NV0O"
    domain_name = "chaitanyaproject.online"
    instance_type = var.environment == "prod" ? "t2.medium" : "t3.micro"
}

