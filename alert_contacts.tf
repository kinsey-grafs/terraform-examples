resource "grafana_contact_point" "team-alias" {
  name = "Team Alias"
  email {
    addresses = ["fake-team@example"]
    message   = "{{ template \"custom_email.message\" .}}"
  }
}