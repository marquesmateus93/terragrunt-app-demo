terraform {
  source = "../../../../terraform-rds/modules/rds/"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

dependency "security_groups" {
  config_path = "../security_groups"
}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name        = dependency.tags.outputs.prefix_name

  security_group_ids = dependency.security_groups.outputs.mysql_security_group_id
}