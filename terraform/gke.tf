locals {
  location = "europe-west4-a"
}

resource "google_container_cluster" "gke" {
  name                     = "vu-sc"
  location                 = local.location
  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
    network_policy_config {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "gke" {
  name       = "vu-sc-node-pool"
  location   = local.location
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
    machine_type = "e2-small"
  }
}

resource "google_compute_global_address" "external_ip" {
  name         = "todo-app"
  address_type = "EXTERNAL"
}