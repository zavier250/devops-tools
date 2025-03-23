output "jenkins_elastic_ip" {
  description = "Elastic IP of the Jenkins instance"
  value       = aws_eip.jenkins_eip.public_ip
}
