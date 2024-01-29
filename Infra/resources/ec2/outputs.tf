output "ec2_instance_public_ip" {
  value = aws_instance.vupico_ec2_instance.public_ip
}

output "ec2_instance_public_dns" {
  value = aws_instance.vupico_ec2_instance.public_dns
}