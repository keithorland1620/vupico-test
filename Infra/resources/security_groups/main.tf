resource "aws_security_group" "vupico_security_group" {
  vpc_id = var.vpc_id

    ingress = [
      for rule in var.ingress_rules : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
        description     = "Ingress rule description"
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = false
      }
    ]

    egress = [
      for rule in var.egress_rules : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
        description     = "Egress rule description"
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = false
      }
    ]
}