locals {
  services = [
    "container.googleapis.com",
    "compute.googleapis.com",
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.services)
  service  = each.key
}

# resource "tls_self_signed_cert" "cert" {
#   subject = {
#     common_name  = "35.227.246.131"
#     organization = "VU"
#   }

#   allowed_uses = [
#     "key_encipherment",
#     "digital_signature",
#     "server_auth",
#   ]

#   validity_period_hours = 24
# }

# resource "google_compute_ssl_certificate" "cert" {
#   name         = "ssl-cert"
#   certificate  = tls_self_signed_cert.cert.cert_pem
#   private_key  = tls_self_signed_cert.cert.private_key_pem
# }