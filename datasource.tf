/*
In our case, we are assuming that a datasource has already been created; 
we don't want Terraform to try to create or delete it while managing 
alert rules.

Therefore, first step is to import the existing DS by its ID (easy to find in the Grafana UI)
  terraform import grafana_data_source.my_data_source dee23ft6d9szkb

Then, do a normal terraform apply on the whole project.

Note that the DS resource below has a lifecycle entry to prevent TF from destroying it.

So to delete all the resources, we can't just do
  terraform apply -destroy

We can do it like this:

tf apply -destroy \
-target="grafana_folder.team_A_folder" \
-target="grafana_rule_group.random-walk-alerts-group" \
-target="grafana_message_template.team_message_template_name" \
-target="grafana_contact_point.team-alias" \
-target="grafana_message_template.team_message_template_name" 

*/

# resource "grafana_data_source" "my_data_source" {
#   name = "aaa_TestData"
#   type = "testdata"
#   uid  = "dee23ft6d9szkb"
#   lifecycle {
#     prevent_destroy = true
#   }
# }