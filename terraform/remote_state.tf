data "terraform_remote_state" "core" {
  backend = "remote"

  config = {
    organization = "fiap-pos-tc"
    workspaces = {
      name = "core-infra"
    }
  }
}
