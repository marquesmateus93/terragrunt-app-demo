terraform {
  source = "../../../../terraform-app-demo/application/target_group/"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

dependency "launch_configuration" {
  config_path = "../launch_configuration"
}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name = dependency.tags.outputs.prefix_name

  launch_configuration_names = dependency.launch_configuration.outputs.launch_configuration_names
}