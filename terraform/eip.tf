resource "aws_eip" "public_ip" {
  instance = aws_instance.http_server.id
  vpc      = true
}
