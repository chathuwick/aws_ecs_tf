variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr01" {
  description = "CIDR for the public subnet01"
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr02" {
  description = "CIDR for the public subnet02"
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr01" {
  description = "CIDR for the private subnet01"
  default = "10.0.3.0/24"
}

variable "private_subnet_cidr02" {
  description = "CIDR for the private subnet02"
  default = "10.0.4.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0080e4c5bc078760e"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/GallagherKey"
}

#variable "RDS_PASSWORD" { }

variable "SNS_Topic_Name" {
  description = "SNS Topic Name"
  default = "ccptopic"
}

variable "sqs_queue" {
  description = "sqs queue name"
  default = "ccpqueue"
}

variable "ecr_repo"{
  description = "ECR Repo Name"
  default = "myapp"
}

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-1924770e"
    us-west-2 = "ami-56ed4936"
    eu-west-1 = "ami-c8337dbb"
  }
}
