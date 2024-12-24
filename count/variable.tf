variable "instance_names" {
    type = list(string)
    default = ["mysql","frontend","backend"]
}

# variable "instance_types" {
#     type = list(string)
#     default = ["t2.micro","t3.micro","t3.small"]
# }

variable "common_tags" {
    type = map 
    default = {
        Environment = "production"
        terraform = "true"
        project = "expense"
    
    }
}