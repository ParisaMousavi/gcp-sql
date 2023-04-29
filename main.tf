# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "this" {
  name             = var.server_name
  region           = var.region
  database_version = var.database_version
  root_password    = var.root_password
  settings {
    tier = var.settings.tier
  }
  deletion_protection = "false"
}

resource "google_sql_database" "this" {
  for_each = toset(var.databases)
  name     = each.value
  instance = google_sql_database_instance.this.name
}

resource "google_sql_user" "default" {
  name     = var.default_user.name
  instance = google_sql_database_instance.this.name
  password = var.default_user.password
  depends_on = [
    google_sql_database_instance.this
  ]
}
