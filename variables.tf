variable "project_name" {
  type        = string
  description = "Globally used project name"
  default     = "minecraft-k8s"
}

variable "region" {
  type        = string
  description = "Azure Region that will be used"
  default     = "West US"
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.20.2"
}
