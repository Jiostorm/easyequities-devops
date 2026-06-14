data "gitea_user" "target" {
  username = var.gitea_user_username
}

resource "gitea_repository" "terraform_docker_exam" {
  name     = "terraform-docker-exam"
  username = data.gitea_user.target.username

  private = true
}

resource "gitea_repository_branch_protection" "main" {
  name     = gitea_repository.terraform_docker_exam.name
  username = gitea_repository.terraform_docker_exam.username

  rule_name = "main"

  enable_push          = true
  push_whitelist_users = [gitea_repository.terraform_docker_exam.username]

  required_approvals = 1

  block_merge_on_outdated_branch  = true
  block_merge_on_rejected_reviews = true
}
