locals {
  required_tags = {
      "project" = var.project
  }
  tags = merge(var.resource_tags, local.required_tags)
}
