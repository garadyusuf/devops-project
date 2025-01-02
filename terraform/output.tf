variable "project_id" {
output "cluster_name" {
  value = google_container_cluster.helloworld.name
}

output "cluster_endpoint" {
  value = google_container_cluster.helloworld.endpoint
}

output "client_certificate" {
  value = google_container_cluster.helloworld.master_auth.0.client_certificate
}

