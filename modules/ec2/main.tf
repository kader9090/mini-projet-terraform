data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  owners = ["099720109477"] 
}
resource "local_file" "file1" {
    filename = "C:/Users/abdel/OneDrive/Bureau/terraform/mini-projet/app/ip_ec2.txt"
    content = "coucou"
}

resource "aws_instance" "abdelkader-ec2-miniprojet" {
  ami             = data.aws_ami.ubuntu.id
  availability_zone = "us-east-1a"
  key_name        = "${var.key_name}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${var.sg_name}"] 
  user_data       = <<-EOF
              #!/bin/bash
              sleep 5
              sudo apt-get update -y
              sudo apt-get -y install nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF    
  tags = {
    Name = "ec2-${var.admin}"
    iac  = "terraform"
  }

  provisioner "local-exec" {
    command = "echo salut de la part de : ${self.id} - ${self.public_ip} - ${self.availability_zone} >> ip_ec2.txt"
  }
  provisioner "remote-exec" {
    inline = [
      #"sleep 5m",
      "echo : salut de la part de : ${self.id} - ${self.public_ip} - ${self.availability_zone} >> ip_ec2.txt"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/abdel/Downloads/abdelkader-terraform.pem")
      host        = self.public_ip
    }
  }
  
}

output "instance_id" {
    value = aws_instance.abdelkader-ec2-miniprojet.id
}


