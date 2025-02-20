# Get Started with Grafana Terraform provider - sample code

This repo sets up the following resources:

1. Alert Folder
2. blah

## Prerequisites

1. Terraform CLI
2. A Grafana stack
3. Grafana [Service account token](https://grafana.com/docs/grafana/latest/administration/service-accounts/)

## Using this code

1. Clone this repo and cd into the directory
2. You need to set up the Grafana provider for your account by setting two config settings that are imported via tf variables.
   - `touch terraform.tfvars`
   - in this file add:

```tf
service_account_token = "{your service account token}"
grafana_url = "{your url}" #Format is "https://mycompany.grafana.net/"
```

## Running Terraform

1. `terraform init` will set up Terraform to be ready to create a plan, which includes getting the NR Terraform provider as stated in the main.tf file
2. `terraform plan` - check out what will be created, if it looks good proceed to...
3. `terraform apply`  - you should now have a few things in your account: dashboards, synthetics, and alerts conditions and policies.
