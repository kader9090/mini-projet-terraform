resource "aws_eip" "abdelkader_eip" {
  vpc      = true
  #instance = aws_instance.abdelkader-ec2-miniprojet.id
}

output "eip_id" {
    value = aws_eip.abdelkader_eip.allocation_id 
    }

output "ip-static" {
  value = aws_eip.abdelkader_eip.public_ip
}