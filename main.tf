## NOTE: App Engine should be enabled manually OR via gcloud before using this Terraform.
## Firestore requires App Engine — terraform cannot create it directly.
##
## gcloud services enable appengine.googleapis.com --project=<project-id>
## gcloud app create --region=us-central --project=<project-id>

# Create App Engine application (only if create_app_engine is true)
resource "google_app_engine_application" "app" {
  count       = var.create_app_engine ? 1 : 0
  project     = var.project_id
  location_id = var.app_engine_location
  database_type = "CLOUD_FIRESTORE"
}

# Create Firestore database (only if create_firestore_database is true)
resource "google_firestore_database" "database" {
  count             = var.create_firestore_database ? 1 : 0
  project           = var.project_id
  name              = var.database_name
  location_id       = var.database_location
  type              = var.database_type
  concurrency_mode  = var.concurrency_mode
  point_in_time_recovery_enablement = var.point_in_time_recovery
  delete_protection_state           = var.delete_protection_state
}

# Create Firestore sample indexes (example)
resource "google_firestore_index" "user_status_index" {
  count = var.create_sample_indexes ? 1 : 0

  project    = var.project_id
  database   = var.create_firestore_database ? google_firestore_database.database[0].name : var.database_name
  collection = "users"

  fields {
    field_path = "status"
    order      = "ASCENDING"
  }

  fields {
    field_path = "created_at"
    order      = "DESCENDING"
  }
}

# Another sample index: order timestamp index
resource "google_firestore_index" "order_timestamp_index" {
  count     = var.create_sample_indexes ? 1 : 0
  project   = var.project_id
  database  = var.create_firestore_database ? google_firestore_database.database[0].name : var.database_name
  collection = "orders"

  fields {
    field_path = "user_id"
    order      = "ASCENDING"
  }

  fields {
    field_path = "timestamp"
    order      = "DESCENDING"
  }
}

## Note: Firestore security rules cannot be managed directly by Terraform.
## Copy and apply rules manually using gcloud OR automate via CI/CD.

# Example rules reference (firestore.rules)
# gcloud firestore databases update --location=us-central1 --rules=file:firestore.rules
