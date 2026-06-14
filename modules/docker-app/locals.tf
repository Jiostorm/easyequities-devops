locals {
  common_exam_container_labels = [
    {
      label = "project"
      value = "devops-exam"
    },
    {
      label = "environment"
      value = "development"
    },
    {
      label = "managed-by"
      value = "terraform"
    }
  ]
}
