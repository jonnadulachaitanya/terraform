# resource "aws_route53_record" "expense" {
#     for_each = aws_instance.expense
#     name = each.key == "frontend" ? var.domain_name : "${each.key}."
#     records =
#     ttl =
#     type =
#     zone_id =
#     allow_overwrite = 
    
# }


resource "aws_route53_record" "expense" {

    for_each = aws_instance.expense
    #front = domain_name
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    ttl = "1"
    type = "A"
    zone_id = var.zone_id
    allow_overwrite = true
}