terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.33.0"
    }
  }
}

provider "google" {
# Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  credentials = ".keys/gcp.json"
  project = "terraform-basic-458911"
  region  = "asia-east1"
}



resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-basic-458911-demo-bucket" // Must be globally unique
  location      = "asia"
  force_destroy = true 

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true


  lifecycle_rule {
    action {
      type = "AbortIncompleteMultipartUpload"
    }
    condition {
      age = 1  // days
    }
  }

}


# resource "google_bigquery_dataset" "dataset" {
#   dataset_id = "<The Dataset Name You Want to Use>"
#   project    = "<Your Project ID>"
#   location   = "US"
# }