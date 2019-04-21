provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "minecraft" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  security_groups = ["Minecraft_allow"]
  user_data = <<-EOF
  #!/bin/bash
  mkdir /home/minecraft
  chmod 0755 /home/minecraft
  wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar
  echo "eula=true" > /home/minecraft/eula.txt
  addgroup minecraft
  adduser minecraft --home /home/minecraft --group minecraft
  chown -R minecraft:minecraft /home/minecraft
  EOF

  tags = {
    Name    = "Minecraft Server"
    Type    = "Vanilla"
    version = "Snapshot"
  }

  key_name = "ubuntu"
}