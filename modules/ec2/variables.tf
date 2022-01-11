variable "instance_type" {
  default = "t3.large"
}
variable "ami" {
  default = "ami-04505e74c0741db8d"
}
variable "key_name" {
  default = "abdelkader-terraform"
}
variable "sg_name" {
  default = "abdelkader_terraform-miniprojet"
  type = string
}
variable "admin" {
  default = "abdelkader"
}
