provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "minecraft" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  security_groups = ["Minecraft_allow"]

  tags = {
    Name    = "Minecraft Server"
    Type    = "Vanilla"
    version = "Snapshot"
  }

  key_name = "ubuntu"
}