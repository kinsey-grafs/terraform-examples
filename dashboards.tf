# # 1. getting started
# resource "grafana_dashboard" "getting_started" {
#   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
#   config_json = file("dashboard_json/1_getting_started.json")
# }


# # 2. Alerts
# resource "grafana_dashboard" "alerts" {
#   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
#   config_json = file("dashboard_json/2_alerts.json")
# }

# # 3. Dashboards
# resource "grafana_dashboard" "dashboards_practices" {
#   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
#   config_json = file("dashboard_json/3_dashboard_practices.json")
# }

# # 4. Terraform
# resource "grafana_dashboard" "terraforming" {
#   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
#   config_json = file("dashboard_json/4_terraforming.json")
# }

# # 5. API Keys and Service Accounts
# resource "grafana_dashboard" "keys" {
#   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
#   config_json = file("dashboard_json/5_keys.json")
# }



# # Alternate way of adding a dashboard.

# #resource "grafana_dashboard" "getting_started" {
# #   folder = grafana_folder.best_practices_folder.uid #created implicitly after dashboard folder
# #   config_json = jsonencode({
# #   "annotations": {
# #     "list": [
# #       {
# #         "builtIn": 1,
# #         "datasource": {
# #           "type": "grafana",
# #           "uid": "-- Grafana --"
# #         },
# #         "enable": true,
# #         "hide": true,
# #         "iconColor": "rgba(0, 211, 255, 1)",
# #         "name": "Annotations & Alerts",
# #         "type": "dashboard"
# #       }
# #     ]
# #   },
# #   "editable": true,
# #   "fiscalYearStartMonth": 0,
# #   "graphTooltip": 0,
# #   "id": 48,
# #   "links": [],
# #   "panels": [
# #     {
# #       "fieldConfig": {
# #         "defaults": {},
# #         "overrides": []
# #       },
# #       "gridPos": {
# #         "h": 22,
# #         "w": 24,
# #         "x": 0,
# #         "y": 0
# #       },
# #       "id": 1,
# #       "options": {
# #         "code": {
# #           "language": "plaintext",
# #           "showLineNumbers": false,
# #           "showMiniMap": false
# #         },
# #         "content": "# 1. Getting Started with Grafana\n- Provisioning new users \n- Your internal observability team: #observability\n- Grafana Learning resources: https://grafana.com/tutorials/\n- Grafana Technical Support for troubleshooting Grafana issues: https://grafana.com/help/\n \n\n## Team Ownership\nTeams are responsible for the following areas.\n\n### Instrumentation\n- Instrumentation should be completed. If additional projects need to be added to Grafana, contact #observability team prior to adding any instrumentation.\n\n\nThe following topics are added as additional resources in this folder:\n\n### 2. Alerts\n\t- required golden signals\n\t- alert notifications destinations\n\t- naming conventions\n\n### 3. Dashboards\n\t- naming conventions\n\t- restoring a previous version \n\n### 4. Terraform\n\t- alerts, examples\n\t- other terraform resources: synthetics, dashboards\n\n### 5. API keys, service accounts\n\t- our processes for safekeeping and rotating sensitive tokens\n\n",
# #         "mode": "markdown"
# #       },
# #       "pluginVersion": "11.6.0-82840",
# #       "title": "",
# #       "type": "text"
# #     }
# #   ],
# #   "preload": false,
# #   "schemaVersion": 41,
# #   "tags": [],
# #   "templating": {
# #     "list": []
# #   },
# #   "time": {
# #     "from": "now-6h",
# #     "to": "now"
# #   },
# #   "timepicker": {},
# #   "timezone": "browser",
# #   "title": "1. Start here - Resources for Grafana & Overview of ownership",
# #   "uid": "aedo8wmcu0su8a",
# #   "version": 6,
# #   "weekStart": ""
# # })
# # }