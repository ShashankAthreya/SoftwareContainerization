provider "google" {
  project = var.project
  region  = "europe-west4"
}
# resource "google_compute_ssl_certificate" "ssl-cert" {
#   name        = "ssl-certificate"
#   certificate = "${file("../certs/cert.pem")}"
#   private_key = "${file("../certs/key.pem")}"
# }


