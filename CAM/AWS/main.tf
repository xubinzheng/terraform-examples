
provider "aws" {
  access_key = "${var.aws_access_id}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}


resource "aws_instance" "aws_instance" {
  instance_type = "t2.micro"
  ami = "ami-1d4e7a66"
  key_name = "${var.key_name}"
  tags {
    Name = "${var.aws_instance_name}"
  }
}
