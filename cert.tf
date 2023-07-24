resource "aws_iam_server_certificate" "test_cert" {
  name             = "some_test_cert"
  certificate_body = file("cert.pem")
  private_key      = file("privatekey.pem")
}