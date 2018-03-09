#####################################################################
##
##      Created 3/2/18 by ucdpadmin. for aws
##
#####################################################################

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

variable "aws_instance_aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "availability_zone" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_name" {
  type = "string"
  description = "Generated"
}

variable "aws_network_vpc_id" {
  type = "string"
  description = "Generated"
}

variable "my_group" {
  type = "string"
  description = "Generated"
}

variable "my_group_vpc_id" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_ami" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "test" {
  type = "string"
  description = "Generated"
}

variable "aws_instance1_name" {
  type = "string"
  description = "Generated"
}

variable "environment_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_agent_name" {
  type = "string"
  description = "agent name"
}

variable "ucd_user" {
  type = "string"
  description = "UCD User."
  default = "PasswordIsAuthToken"
}

variable "ucd_password" {
  type = "string"
  description = "UCD Password."
  default = ""
}

variable "ucd_server_url" {
  type = "string"
  description = "UCD Server URL."
  default = "http://54.89.250.86:9080"
}

variable "private_key" {
  type = "string"
  description = "Generated"
}

