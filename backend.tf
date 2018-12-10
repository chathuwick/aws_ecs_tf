terraform {
  backend "s3" {
    bucket = "chathu-tf-state69"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
