resource "aws_vpc" "default" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "default" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "my_subnet"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

}

resource "aws_eip" "nat" {
  vpc   = true

}

resource "aws_nat_gateway" "nat" {

  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.default.id}"

}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.default.id}"
  route_table_id = "${aws_route_table.public.id}"
}
