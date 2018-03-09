#####################################################################
##
##      Created 2/7/18 by ucdpadmin.
##
#####################################################################

## REFERENCE {"reference_network":{"type": "reference_network"}}

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

variable "aws_instance_ami" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_key_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_aws_instance_type" {
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

variable "aws_instance1_ami" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_key_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_availability_zone" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_name" {
  type = "string"
  description = "Generated"
}

variable "subnet_id" {
  type = "string"
  description = "Generated"
}

data "aws_subnet" "subnet" {
  id = "${var.subnet_id}"
}

resource "aws_instance" "aws_instance" {
  ami = "${var.aws_instance_ami}"
  key_name = "${var.aws_instance_key_name}"
  instance_type = "${var.aws_instance_aws_instance_type}"
  availability_zone = "${var.aws_instance_availability_zone}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  aws_alb.subnets         = ["${data.aws_subnet.subnet.id}"]
  tags {
    Name = "${var.aws_instance_name}"
  }
}

resource "aws_instance" "aws_instance1" {
  ami = "${var.aws_instance1_ami}"
  key_name = "${var.aws_instance1_key_name}"
  instance_type = "${var.aws_instance1_aws_instance_type}"
  availability_zone = "${var.aws_instance1_availability_zone}"
  tags {
    Name = "${var.aws_instance1_name}"
  }
}