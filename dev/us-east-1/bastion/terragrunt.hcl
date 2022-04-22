terraform {
  source = "../../../../terraform-app-demo/bastion/"
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

  private_key = file("key_files/marques")

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name = dependency.tags.outputs.prefix_name

  security_group_id = dependency.security_groups.outputs.bastion_security_group_id
}