resource "grafana_message_template" "team_message_template_name" {
  name = "custom_emails"

  template = <<EOT
 {{ define "custom_email.message" }}
 Lorem ipsum - Custom alert!
 {{ end }}
 EOT
}