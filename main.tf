# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "this" {
  name             = var.server_name
  region           = var.region
  database_version = var.database_version
  settings {
    tier = var.settings.tier
  }

  deletion_protection = "true"
}

resource "google_sql_database" "this" {
  for_each = var.databases
  name     = each.value.name
  instance = google_sql_database_instance.this.name
}