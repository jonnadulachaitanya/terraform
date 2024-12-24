data "aws_ami" "expense1" {
    most_recent = "true"
    owner = "973714476881"

    filter {
        name = "ami-name"
        value = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name = "root-device-type"
        value = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        value = ["hvm"]

    }
}