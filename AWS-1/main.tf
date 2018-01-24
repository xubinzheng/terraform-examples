#####################################################################
##
##      Created 1/24/18 by ucdpadmin. For Cloud admin@SL
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

variable "ami" {
  type = "string"
  description = "Generated"
}

variable "key_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_availability_zone" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_name" {
  type = "string"
  description = "Generated"
}

resource "aws_instance" "aws_instance" {
  ami = "${var.ami}"
  key_name = "${var.key_name}"
  instance_type = "${var.aws_instance_type}"
  availability_zone = "${var.aws_instance_availability_zone}"
  tags {
    Name = "${var.aws_instance_name}"
  }
}