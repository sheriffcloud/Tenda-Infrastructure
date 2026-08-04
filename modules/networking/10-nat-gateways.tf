resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  count         = var.az_count

  tags = {
    Name        = "${var.project_name}-${var.environment}-nat-gateway-${count.index + 1}"
    Environment = var.environment
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}