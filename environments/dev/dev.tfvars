# Project Configuration
project_id = "myproject-non-prod"
region     = "us-central1"

# Project information
project_name = "myproject-non-prod"
environment  = "dev"

# App Engine (if required for Firestore)
app_engine_location = "us-central1"

# Firestore Database Configuration
database_name                 = "firestore-dev"
database_location             = "us-central1"
database_type                 = "FIRESTORE_NATIVE"
concurrency_mode              = "OPTIMISTIC"
create_sample_indexes         = true

# Labels for resource management
labels = {
  project     = "myproject-non-prod"
  environment = "dev"
}
