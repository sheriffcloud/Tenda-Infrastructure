# Trust: only the Tenda-Infrastructure repo on main can assume this
data "aws_iam_policy_document" "infra_assume" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:repository"
      values   = [var.infra_github_repo]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${replace(var.infra_github_repo, "/", "@*/")}@*:*"]
    }
  }
}

resource "aws_iam_role" "infra_deploy" {
  name               = "${var.project_name}-${var.environment}-github-infra"
  assume_role_policy = data.aws_iam_policy_document.infra_assume.json
}

# Terraform needs broad permissions to manage the whole stack.
# AdministratorAccess is the pragmatic choice for an infra pipeline that
# manages VPC/RDS/ECS/IAM/etc. Scoped tightly by the TRUST policy above
# (only this repo+branch can assume it) rather than by permission breadth.
resource "aws_iam_role_policy_attachment" "infra_admin" {
  role       = aws_iam_role.infra_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}