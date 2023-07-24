#Create Internet gateway
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.my_vpc.id


}

#Create Route Table for Public Subnets
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }

}
# resource "aws_nat_gateway" "natgw" {
#   allocation_id = aws_eip.my-eip.id
#   subnet_id     = [ aws_subnet.web_sub1a.id , aws_subnet.web_sub1b.vpc_id ]

#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [ aws_internet_gateway.IG ]
# }