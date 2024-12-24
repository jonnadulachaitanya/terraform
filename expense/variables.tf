variable "instance_names" {
    type = list(string)
    default = ["mysql","backend","frontend"]
}

variable "zone_id" {
    default = "Z07531171JTKXQEA9NV0O"
}
variable "domain_name" {
    default = "chaitanyaproject.online"
}