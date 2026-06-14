output "nginx_container_id" {
  value       = docker_container.exam_web_server.id
  description = "Nginx Container ID"
}

output "health_checker_container_id" {
  value       = docker_container.exam_health_checker.id
  description = "Health Checker Container ID"
}

output "network_id" {
  value       = docker_network.exam_network.id
  description = "Exam Network ID"
}
