#/bin/bash
echo 'terraform {
  backend "s3" {
    bucket = "chathu-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}' > backend.tf
