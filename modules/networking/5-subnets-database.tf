resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 20)
  count             = var.az_count
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.project_name}-${var.environment}-database-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private"
  }
}