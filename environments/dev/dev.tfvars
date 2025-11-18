# Project Configuration
project_id = "qxnzvweb-6f2k-us22-ed2z-blqcrr"
region     = "us-central1"

# Project information
project_name = "rate-automation"
environment  = "dev"

# App Engine (if required for Firestore)
app_engine_location = "us-central1"

# Firestore Database Configuration
database_name                 = "rateauto-firestore-dev-1"
database_location             = "us-central1"
database_type                 = "FIRESTORE_NATIVE"
concurrency_mode              = "OPTIMISTIC"
create_sample_indexes         = true

# Labels for resource management
labels = {
  project     = "rate-automation-non-prod"
  environment = "dev"
  aide_id     = "uweg110-012345"
}
