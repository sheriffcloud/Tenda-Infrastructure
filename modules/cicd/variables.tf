
variable "environment" {
  description = "Environment name (production, staging)"
  type        = string
  #   default     = "production"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  #   default     = "tenda"
}

variable "github_repo" {
  type        = string
  description = "GitHub org/repo allowed to assume the deploy role"
  # e.g. "sheriffcloud/tenda-app"
}

variable "deploy_branch" {
  type        = string
  description = "Branch allowed to deploy"
  #   default     = "main"
}

variable "execution_role_arn" {
  type        = string
  description = "ECS task execution role ARN (for iam:PassRole)"
}

variable "task_role_arn" {
  type        = string
  description = "ECS task role ARN (for iam:PassRole)"
}

variable "infra_github_repo" {
  type        = string
  description = "GitHub org/repo allowed to assume the deploy role"
  # default     = "sheriffcloud/Tenda-Infrastructure"
}