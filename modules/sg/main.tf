resource "aws_security_group" "abdelkader_miniprojet" {
    name = "abdelkader_miniprojet"
    description = "Allow 80 and 443"
    tags = {
        Name = "allow_80 and 443"
    }

    ingress {
        description = "allow 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "allow 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    ingress {
        description = "allow 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


output "sg_out" {
    value = aws_security_group.abdelkader_miniprojet.name    
    }