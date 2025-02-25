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




# resource "grafana_rule_group" "random-walk-alerts-group" {
#   name             = "My Alert Rules"
#   folder_uid       = grafana_folder.team_A_folder.uid
#   interval_seconds = 60

#   rule {
#     name      = "My Random Walk Alert"
#     condition = "C"
#     for       = "0s"

#     // Query the datasource.
#     data {
#       ref_id = "A"
#       relative_time_range {
#         from = 600
#         to   = 0
#       }
#       datasource_uid = grafana_data_source.my_data_source.uid
#       // `model` is a JSON blob that sends datasource-specific data.
#       // It's different for every datasource. The alert's query is defined here.
#       model = jsonencode({
#         intervalMs    = 1000
#         maxDataPoints = 43200
#         refId         = "A"
#       })
#     }

#     // The query was configured to obtain data from the last 60 seconds. Let's alert on the average value of that series using a Reduce stage.
#     data {
#       datasource_uid = "__expr__"
#       // You can also create a rule in the UI, then GET that rule to obtain the JSON.
#       // This can be helpful when using more complex reduce expressions.
#       model  = <<EOT
# {"conditions":[{"evaluator":{"params":[0,0],"type":"gt"},"operator":{"type":"and"},"query":{"params":["A"]},"reducer":{"params":[],"type":"last"},"type":"avg"}],"datasource":{"name":"Expression","type":"__expr__","uid":"__expr__"},"expression":"A","hide":false,"intervalMs":1000,"maxDataPoints":43200,"reducer":"last","refId":"B","type":"reduce"}
# EOT
#       ref_id = "B"
#       relative_time_range {
#         from = 0
#         to   = 0
#       }
#     }

#     // Now, let's use a math expression as our threshold.
#     // We want to alert when the value of stage "B" above exceeds 70.
#     data {
#       datasource_uid = "__expr__"
#       ref_id         = "C"
#       relative_time_range {
#         from = 0
#         to   = 0
#       }
#       model = jsonencode({
#         expression = "$B > 70"
#         type       = "math"
#         refId      = "C"
#       })
#     }
#   }
# }