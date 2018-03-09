#####################################################################
##
##      Created 3/2/18 by ucdpadmin. for aws
##
#####################################################################

## REFERENCE {"aws_network":{"type": "aws_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  access_key = "${var.aws_access_id}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
  version = "~> 1.8"
}

provider "ucd" {
  username       = "${var.ucd_user}"
  password       = "${var.ucd_password}"
  ucd_server_url = "${var.ucd_server_url}"
}


data "aws_security_group" "my_group" {
  name = "${var.my_group}"
  vpc_id = "${var.my_group_vpc_id}"
}

resource "aws_instance" "aws_instance" {
  ami = "${var.aws_instance_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.aws_instance_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  vpc_security_group_ids = ["${data.aws_security_group.my_group.id}"]
  connection {
    user = "TODO"
    private_key = "${var.private_key}"
  }
  provisioner "ucd" {
    agent_name      = "${var.aws_instance_agent_name}"
    ucd_server_url  = "${var.ucd_server_url}"
    ucd_user        = "${var.ucd_user}"
    ucd_password    = "${var.ucd_password}"
  }
  tags {
    Name = "${var.aws_instance_name}"
  }
}

resource "aws_instance" "aws_instance1" {
  ami = "${var.aws_instance1_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.aws_instance1_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  tags {
    Name = "${var.aws_instance1_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "aws-temp-public-key"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_subnet" "subnet" {
  vpc_id = "${var.aws_network_vpc_id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "Main"
  }
}

resource "ucd_component_mapping" "jke_war" {
  component = "jke.war"
  description = "jke.war Component"
  parent_id = "${ucd_agent_mapping.aws_instance_agent.id}"
}

resource "ucd_component_process_request" "jke_war" {
  component = "jke.war"
  environment = "${ucd_environment.environment.id}"
  process = "CHOOSE  #  deploy, property_test, unit_test, unit_test_failure, unit_test_long_running, update, win_unit_test"
  resource = "${ucd_component_mapping.jke_war.id}"
  version = "LATEST"
}

resource "ucd_resource_tree" "resource_tree" {
  base_resource_group_name = "Base Resource for environment ${var.environment_name}"
}

resource "ucd_environment" "environment" {
  name = "${var.environment_name}"
  application = "JKE"
  base_resource_group ="${ucd_resource_tree.resource_tree.id}"
  component_property {
      component = "jke.war"
      name = "JKE_DB_HOST"
      value = "localhost"
      secure = false
  }
}

resource "ucd_agent_mapping" "aws_instance_agent" {
  description = "Agent to manage the aws_instance server"
  agent_name = "${var.aws_instance_agent_name}.${aws_instance.aws_instance.private_ip}"
  parent_id = "${ucd_resource_tree.resource_tree.id}"
}

