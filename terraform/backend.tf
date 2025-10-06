terraform {
  cloud {
    organization = "fiap-pos-tc"

    workspaces {
      name = "db-infra"
    }
  }
}