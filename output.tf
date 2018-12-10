/*output "instance" {
  value = "${aws_instance.wb.public_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}

output "sns" {
  value = "${aws_sns_topic.user_updates.arn}"
}

output "sqs"{
    value = "${aws_sqs_queue.terraform_queue.id}"
}*/

output "ecr-repository-URL" {
  value = "${aws_ecr_repository.ccprepo.repository_url}"
}

output "elb" {
  value = "${aws_elb.myapp-elb.dns_name}"
}