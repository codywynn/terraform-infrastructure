variable "region" {}
variable "shared_credentials_file" {}
variable "profile" {}
variable "my_ami" {
  type = "map"
}

provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.my_ami, var.region)}"
  instance_type = "t1.micro"
  tags {
    Name = "example_linux"
  }
}