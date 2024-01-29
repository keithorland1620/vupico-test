# Associate Internet Gateway with the public subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}

# Create route to Internet Gateway in the main route table
resource "aws_route" "internet_gateway_route" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
}
