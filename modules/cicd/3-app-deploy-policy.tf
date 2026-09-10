data "aws_iam_policy_document" "deploy" {
  # Push images to ECR
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
      "ecr:BatchGetImage",
    ]
    resources = ["*"]
  }

  # Update ECS services
  statement {
    actions = [
      "ecs:UpdateService",
      "ecs:DescribeServices",
      "ecs:RegisterTaskDefinition",
      "ecs:DescribeTaskDefinition",
    ]
    resources = ["*"]
  }

  # Pass the task roles to ECS during deploy
  statement {
    actions   = ["iam:PassRole"]
    resources = [var.execution_role_arn, var.task_role_arn]
  }

  # Sync landing page to S3
  statement {
    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::${var.project_name}-${var.environment}-landing",
      "arn:aws:s3:::${var.project_name}-${var.environment}-landing/*",
    ]
  }

  # Invalidate CloudFront cache
  statement {
    actions   = ["cloudfront:CreateInvalidation"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "deploy" {
  name   = "deploy"
  role   = aws_iam_role.github_deploy.id
  policy = data.aws_iam_policy_document.deploy.json
}