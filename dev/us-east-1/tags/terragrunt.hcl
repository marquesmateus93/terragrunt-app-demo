terraform {
  source = "../../../../terraform-tags/modules/tags"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  commons = {
    account_id  = get_aws_account_id()
    email       = "mateusmarques1993@gmail.com"
  }

  prefix_name = "Dev-Marques-Ops-"
}