# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "test_02332"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
}

# Questa risorsa non tocca AWS, genera solo un nome casuale!
resource "random_pet" "server_name" {
  length = 2
}

output "success_message" {
  value = "Pipeline CI/CD completata al 100%! Risorsa simulata creata: ${random_pet.server_name.id}"
}