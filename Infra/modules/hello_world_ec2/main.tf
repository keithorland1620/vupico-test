module "ec2"{
    source                          = "../../resources/ec2"
    ami                             = var.ami
    instance_type                   = var.instance_type
    subnet_id                       = module.subnet.subnet_id
    vpc_security_group_ids          = module.security_groups.security_group_id
    instance_name                   = var.instance_name
    user_data                       = var.user_data
}

module "vpc" {
     source                          = "../../resources/vpc"
     cidr_block                      =  var.vpc_cidr_block
     enable_dns_support              =  var.enable_dns_support
     enable_dns_hostnames            =  var.enable_dns_hostnames
}

module "subnet" {
    source                          = "../../resources/subnet"
    vpc_id                          = module.vpc.vpc_id
    cidr_block                      = var.subnet_cidr_block
    availability_zone               = var.availability_zone
    map_public_ip_on_launch         = var.map_public_ip_on_launch
}

module "security_groups" {
    source                          = "../../resources/security_groups"
    vpc_id                          = module.vpc.vpc_id
    ingress_rules = [
        {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        },
        {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ]
    egress_rules = [
        {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ]
 
}

module "internet_gateway" {
    source                          = "../../resources/internet_gateway"
    vpc_id                          = module.vpc.vpc_id
}

module "route_table" {
    source                          = "../../resources/route_table"
    subnet_id                       = module.subnet.subnet_id
    route_table_id                  = module.vpc.default_route_table_id
    destination_cidr_block          = var.destination_cidr_block
    gateway_id                      = module.internet_gateway.igw_id
}