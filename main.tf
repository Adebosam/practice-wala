terraform {
   required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "sammy-project-467916"
  credentials = file("sammy-project-467916-847d726271c6.json")
}
