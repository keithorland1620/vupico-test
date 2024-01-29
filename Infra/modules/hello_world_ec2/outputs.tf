output "vupico_test_public_ip" {
  value = module.ec2.ec2_instance_public_ip
}

output "vupico_test_public_dns" {
  value = module.ec2.ec2_instance_public_dns
}