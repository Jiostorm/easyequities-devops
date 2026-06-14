terraform {
  required_providers {
    gitea = {
      source  = "go-gitea/gitea"
      version = "0.6.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.4.0"
    }
  }
}
