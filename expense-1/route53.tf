resource "aws_route53-record" "expense1" {
    count = length(var.instance_names)
    zone_id = var.zone_id
    ttl = "A"
    #chaitanyaproject.online
    name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}"."${var.domain_name}"
    record = var.instance_names[count.index] == "frontend" ? "${aws_instance.expense1[count.index].public_ip}" : "${aws_instance.expense1[count.index].private_ip}"
    allow_overwrite = "true"

}