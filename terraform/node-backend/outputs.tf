output "node_be_elastic_ip" {
  description = "Elastic IP of the node instance"
  value       = aws_eip.node_be_eip.public_ip
}
