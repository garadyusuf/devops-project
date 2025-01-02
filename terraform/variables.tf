variable "project_id" {
  type = string
  default = "sandbox-400418"
}

variable "region" {
  type = string
  default = "europe-west2-a"
}

variable "cluster_name" {
  type = string
  default = "helloworld"
}

variable "node_count" {
  type = number
  default = 2
}

variable "node_machine_type" {
  type = string
  default = "e2-medium"
}
