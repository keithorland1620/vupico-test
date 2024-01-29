locals {
  common_vars = yamldecode(file("${get_repo_root()}/Infra/config/hello_world_ec2.yaml"))["common_vars"]
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

terraform {
  source = "../../..//modules/hello_world_ec2"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = merge(
  local.common_vars
)

