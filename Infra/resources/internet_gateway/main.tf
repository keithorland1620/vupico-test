# Create Internet Gateway
resource "aws_internet_gateway" "vupico_igw" {
  vpc_id = var.vpc_id
}
