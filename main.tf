
# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}



resource "aws_instance" "my-ec2"{
    ami= var.image
    instance_type= var.instance_type
    key_name      = "Abdokey"
    security_groups = [aws_security_group.ssh_access.name]
     
    
}
resource "aws_eip" "my_eip" {
  vpc =   true  
}
resource "aws_eip_association" "my_eip_assoc" {
  instance_id   = aws_instance.my-ec2.id
  allocation_id = aws_eip.my_eip.id
}
output "instance_ip" {
  value = aws_eip.my_eip.public_ip
}