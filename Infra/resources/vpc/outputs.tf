output "vpc_id" {
  value = aws_vpc.vupico_vpc.id
}

output "default_route_table_id" {
  value = aws_vpc.vupico_vpc.default_route_table_id
}