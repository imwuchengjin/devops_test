terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "http_server" {
  ami           = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.my_interface.id
    device_index         = 0
  }

  tags = {
    Name = "ExampleAppServerInstance"
  }

}
