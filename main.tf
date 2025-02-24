variable "service_account_token" {}
variable "grafana_url" {}

terraform {
  required_version = "~> 1.0"
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.19.0, < 4.0.0"
    }
  }
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.service_account_token
}