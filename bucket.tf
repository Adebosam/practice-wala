resource "google_storage_bucket" "gcp-bucket" {
  name     = "oihoma-bucket-adebo442"
  location = "US"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "gcp-bucket1" {
  name     = "oihoma-bucket-adebo443"
  location = "EUROPE-WEST1"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}