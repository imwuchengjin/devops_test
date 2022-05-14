resource "aws_network_interface" "my_interface" {
  subnet_id   = aws_subnet.default.id
  private_ips = ["10.10.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}
