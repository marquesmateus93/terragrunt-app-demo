terraform {
  source = "../../../../terraform-app-demo/application/domain/"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

dependency "load_balancer" {
  config_path = "../load_balancer"
}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name = dependency.tags.outputs.prefix_name

  alias = {
    dns_name = dependency.load_balancer.outputs.dns_name
    zone_id = dependency.load_balancer.outputs.zone_id
  }
}