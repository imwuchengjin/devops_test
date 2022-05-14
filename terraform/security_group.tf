resource "aws_security_group" "security_test" {
  name        = "security_test"
  description = "Allows SSH access to the bastion server"

  vpc_id = "${aws_vpc.default.id}"

  ingress {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/32"]
      description     = "all IP"
  }

  ingress {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/32"]
      description     = "all IP"
  }

}

