# --------------------
# Existing MySQL instance
# --------------------
resource "google_sql_database_instance" "mysql_instance" {
  name             = "mysql-db"
  region           = "us-central1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false
}

# --------------------
# New PostgreSQL instance
# --------------------
resource "google_sql_database_instance" "postgres_instance" {
  name             = "postgres-db"
  region           = "us-central1"
  database_version = "POSTGRES_14"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true
      # authorized_networks {    # optional
      #   name  = "office"
      #   value = "203.0.113.0/32"
      # }
    }
  }

  deletion_protection = false
}

# Optional: create a database inside the Postgres instance
resource "google_sql_database" "postgres_db" {
  name     = "appdb"
  instance = google_sql_database_instance.postgres_instance.name
}

# Optional: create a user for Postgres
resource "google_sql_user" "postgres_user" {
  name     = "appuser"
  instance = google_sql_database_instance.postgres_instance.name
  password = "S3cureP@ssw0rd!"   # <- use Secret Manager for production
}

