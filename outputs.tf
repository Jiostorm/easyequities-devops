output "repository_clone_url" {
  value       = gitea_repository.terraform_docker_exam.clone_url
  description = "Gitea Repository Clone URL"
}

output "repository_web_url" {
  value       = gitea_repository.terraform_docker_exam.html_url
  description = "Gitea Repository Web URL"
}

output "docker_nginx_container_id" {
  value       = module.docker_app.nginx_container_id
  description = "Docker Nginx Container ID"
}

output "docker_health_checker_container_id" {
  value       = module.docker_app.health_checker_container_id
  description = "Docker Health Checker Container ID"
}

output "docker_network_id" {
  value       = module.docker_app.network_id
  description = "Docker Exam Network ID"
}
