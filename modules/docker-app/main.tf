data "docker_registry_image" "nginx" {
  name = "nginx:1.27.4"
}
data "docker_registry_image" "curl" {
  name = "curlimages/curl:8.17.0"
}

resource "docker_image" "nginx" {
  name          = data.docker_registry_image.nginx.name
  pull_triggers = [data.docker_registry_image.nginx.sha256_digest]
}
resource "docker_image" "curl" {
  name          = data.docker_registry_image.curl.name
  pull_triggers = [data.docker_registry_image.curl.sha256_digest]
}


resource "docker_network" "exam_network" {
  name = "exam-network"
}

resource "docker_volume" "exam_volume" {
  name = "exam-web-data"
}

resource "docker_container" "exam_web_server" {
  name  = "exam-web-server"
  image = docker_image.nginx.name
  rm    = true

  networks_advanced {
    name = docker_network.exam_network.name
  }

  ports {
    internal = 80
    external = var.host_port_number
  }

  volumes {
    container_path = "/var/cache/nginx"
    volume_name    = docker_volume.exam_volume.name
  }

  healthcheck {
    interval = "30s"
    test     = ["CMD", "curl", "-sf", "http://localhost:80"]
  }

  dynamic "labels" {
    for_each = local.common_exam_container_labels

    content {
      label = labels.value.label
      value = labels.value.value
    }
  }
}

resource "docker_container" "exam_health_checker" {
  name    = "exam-health-checker"
  image   = docker_image.curl.name
  restart = "always"

  networks_advanced {
    name = docker_network.exam_network.name
  }

  entrypoint = ["/bin/sh", "-c"]
  command = [
    "while true; do curl -sf 'http://exam-web-server:80' || echo 'Health check failed'; sleep 30; done"
  ]

  depends_on = [docker_container.exam_web_server]

  dynamic "labels" {
    for_each = local.common_exam_container_labels

    content {
      label = labels.value.label
      value = labels.value.value
    }
  }
}
