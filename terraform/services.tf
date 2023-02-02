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