# this was pulled from the Grafana UI, and some edits were then made (see comments)
resource "grafana_rule_group" "node_cpu_seconds_total" {

  # this isn't relevant in cloud; Grafana code creates this but doesn't have awareness
  # that it's running in cloud, so it just includes it by default.
  # org_id           = 1

  name             = "CPU alerts"
  folder_uid       = grafana_folder.team_A_folder.uid
  interval_seconds = 60

  rule {
    name      = var.CPU_alert_name
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

	  # Hardcoding this in our example, so we can just focus on alerts, not datasources
      datasource_uid = "grafanacloud-prom"

	  # Every datasource (type, not instance) has its own "model"
	  # - this is an example for a Prometheus datasource.
	  # We pull this from a variable.
      model          = var.CPU_alert_query_model

    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[20],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    is_paused      = false

    notification_settings {
      contact_point = "Team Alias"
      group_by      = null
      mute_timings  = null
    }
  }
}