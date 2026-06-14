variable "gitea_url" {
  type        = string
  description = "Gitea Base URL"
  default     = "http://localhost:3000/"
}

variable "gitea_token" {
  type        = string
  description = "Gitea Access Token"
}

variable "gitea_user_username" {
  type        = string
  description = "Gitea User Account Username"
}

variable "docker_host_socket" {
  type        = string
  description = "Docker Host Socket"
}
