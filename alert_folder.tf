resource "grafana_data_source" "my_data_source" {
  name = "TestData"
  type = "testdata"
}

resource "grafana_folder" "team_A_folder" {
  title = "Team A Folder"
}