module "sg" {
  source = "../modules/sg"
}

module "eip" {
  source = "../modules/eip"
 
}

module "ebs" {
  source = "../modules/ebs" 
}


module "ec2" {
  source = "../modules/ec2"
  sg_name = "${module.sg.sg_out}"    
  admin = "abdelkader"
  #ami = "ami-04505e74c0741db8d"
  instance_type = "t3.large"
  key_name = "abdelkader-terraform"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = module.ec2.instance_id
  allocation_id = module.eip.eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.volume_id
  instance_id = module.ec2.instance_id
}




