resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  count  = var.az_count


  tags = {
    Name        = "${var.project_name}-${var.environment}-database-rt-${count.index + 1}"
    Environment = var.environment

  }
}


resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database[count.index].id
  count          = var.az_count
}