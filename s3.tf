resource "aws_s3_bucket" "terraform-state" {
    bucket = "chathu-tf-state69"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
