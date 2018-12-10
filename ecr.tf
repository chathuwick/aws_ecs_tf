resource "aws_ecr_repository" "ccprepo" {
  name = "${var.ecr_repo}"
}