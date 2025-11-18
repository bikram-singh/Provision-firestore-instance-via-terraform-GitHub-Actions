# Firestore Terraform Infrastructure

This repository contains Terraform configuration for managing Google Cloud Firestore infrastructure across multiple environments.

## Project structure
- main.tf                 # Main Terraform configuration
- variables.tf            # Variable definitions
- outputs.tf              # Output definitions
- provider.tf             # Provider configuration
- firestore.rules         # Firestore security rules
- environments/           # Environment-specific configurations
  - dev/
    - dev.tfvars
    - dev.backend
- .github/workflows/firestore.yaml  # GitHub Actions workflow (plan/apply)
- .gitignore

## How to use
1. Edit `environments/<env>/*.tfvars` with your project IDs and bucket names.
2. Configure remote backend (GCS) as per environment backend files.
3. Run `terraform init` and `terraform plan` in this directory or use the provided GitHub Actions workflow.

