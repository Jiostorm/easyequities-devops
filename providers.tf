provider "gitea" {
  base_url = var.gitea_url
  token    = var.gitea_token

  insecure = true
}

provider "docker" {
  host = var.docker_host_socket
}
