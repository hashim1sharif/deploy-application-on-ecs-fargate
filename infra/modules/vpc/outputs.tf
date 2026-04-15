output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_az1_id" {
  value = aws_route_table.private_az1.id
}

output "private_route_table_az2_id" {
  value = aws_route_table.private_az2.id
}

output "nat_gateway_az1_id" {
  value = aws_nat_gateway.az1.id
}

output "nat_gateway_az2_id" {
  value = aws_nat_gateway.az2.id
}