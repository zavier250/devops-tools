variable "key_name" {
  description = "Name of the AWS SSH Key Pair"
  type        = string
  default     = "zxu-2025"
}

# variable for instance name
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "zxu-2025"
}

# variable for instance class
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}
