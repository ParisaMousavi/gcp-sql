output "server_name" {
  value = google_sql_database_instance.this.name
}

output "server_id" {
  value = google_sql_database_instance.this.id
}

output "server_project" {
  value = google_sql_database_instance.this.project
}

output "connection_name" {
  value = google_sql_database_instance.this.connection_name
}


output "databases" {
  value = {
    for db in keys(google_sql_database.this) : db => {
      id   = google_sql_database.this[db].id
      name = google_sql_database.this[db].name
    }
  }
}

