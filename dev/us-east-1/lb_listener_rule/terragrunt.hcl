terraform {
  source = "../../../../terraform-app-demo/application/lb_listener_rule/"
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

dependency "domain" {
  config_path = "../domain"
}

dependency "lb_listener" {
  config_path = "../lb_listener"
}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name       = dependency.tags.outputs.prefix_name

  lb_listener_arn   = dependency.lb_listener.outputs.lb_listener_arn
  target_group_arn  = dependency.target_group.outputs.target_groups_arn
  host_headers      = dependency.domain.outputs.host_headers
}