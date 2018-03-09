#####################################################################
##
##      Created 10/31/17 by admin. For Cloud UCD-P@RS5
##
#####################################################################

terraform {
  required_version = "> 0.7.0"
}

provider "aws" {
  access_key = "${var.aws_access_id}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

variable "aws_access_id" {
  type = "string"
  description = "Generated"
}

variable "aws_secret_key" {
  type = "string"
  description = "Generated"
}

variable "region" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "ami" {
  type = "string"
  description = "Generated"
}

variable "key_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_name" {
  type = "string"
  description = "Generated"
}

resource "aws_instance" "aws_instance" {
  instance_type = "${var.aws_instance_type}"
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  tags {
    Name = "${var.aws_instance_name}"
  }
}