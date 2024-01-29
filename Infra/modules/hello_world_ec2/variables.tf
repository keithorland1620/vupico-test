## EC2
variable "ami" {}
variable "instance_type" {}
variable "instance_name" {}
variable "user_data" {}

## VPC
variable "vpc_cidr_block" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}

## SUBNET
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "map_public_ip_on_launch" {}

## ROUTE TABLE
variable "destination_cidr_block" {}

