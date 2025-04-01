output "node_fe_elastic_ip" {
  description = "Elastic IP of the Jenkins instance"
  value       = aws_eip.node_fe_eip.public_ip
}
