resource "aws_ebs_volume" "abdelkader-ebs" {
  availability_zone = "us-east-1a"
  size              = "${var.taille}"
  #instance = aws_instance.abdelkader-ec2.id
  tags = {
    Name = "${var.ebs-tag}"
  }
}

output "volume_id" {
    value = aws_ebs_volume.abdelkader-ebs.id    
    }