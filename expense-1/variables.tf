variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]

}

variable "instance_type" {
  type    = list(string)
  default = []
}

variable "common_tags" {
  type = map(any)
  default = {
    Environment = "production"
    terraform   = "true"
    project     = "expense"
  }
}

variable "zone_id" {
  default = "Z07531171JTKXQEA9NV0O"
}

variable "domain_name" {
  default = "chaitanyaproject.online"
}