#/bin/bash
echo 'terraform {
  backend "s3" {
    bucket = "chathu-tf-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}' > backend.tf
