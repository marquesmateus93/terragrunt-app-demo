terraform {
  source = "../../../../terraform-app-demo/application/lb_listener/"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

dependency "target_group" {
  config_path = "../target_group"
}

dependency "load_balancer" {
  config_path = "../load_balancer"
}

dependency "domain" {
  config_path = "../domain"
}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name       = dependency.tags.outputs.prefix_name

  target_group_arn  = dependency.target_group.outputs.target_groups_arn
  load_balancer_arn = dependency.load_balancer.outputs.load_balancer_arn
  certificate_arn   = dependency.domain.outputs.certificate_arn
}