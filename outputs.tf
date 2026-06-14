output "repository_clone_url" {
  value       = gitea_repository.terraform_docker_exam.clone_url
  description = "Gitea Repository Clone URL"
}

output "repository_web_url" {
  value       = gitea_repository.terraform_docker_exam.html_url
  description = "Gitea Repository Web URL"
}
