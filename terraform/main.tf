resource "google_container_cluster" "helloworld" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = var.node_count

  deletion_protection = false  

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
