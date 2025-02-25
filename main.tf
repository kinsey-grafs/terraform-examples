variable "service_account_token" {}
variable "grafana_url" {}

variable "CPU_alert_name" {
	type = string
	default = "not specified in TF vars"
}
variable "CPU_alert_query_model" {
	type = string
	default = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"grafanacloud-prom\"},\"editorMode\":\"code\",\"expr\":\"sum(rate(node_cpu_seconds_total{}[$__rate_interval]) )\",\"hide\":false,\"instant\":true,\"intervalMs\":1000,\"legendFormat\":\"__auto\",\"maxDataPoints\":43200,\"range\":false,\"refId\":\"A\"}"
}

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