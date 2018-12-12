resource "aws_key_pair" "mykeypair" {
  key_name = "vpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}
