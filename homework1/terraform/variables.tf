variable "credentials" {
  description = "Service account credentials."
  default     = "keys/my-creds.json"
  
}

variable "project" {
  description = "project name."
  default     = "terraform-demo-448519"

}

variable "region" {
  description = "project region."
  default     = "us-central1"

}

variable "location" {
  description = "project location."
  default     = "US"

}

variable "bq_dataset_name" {
  description = "BigQuery dataset name."
  default     = "demo_dataset"

}

variable "gcs_bucket_name" {
  description = "GCS bucket name."
  default     = "terraform-demo-448519"

}

variable "gcs_storage_class" {
  description = "GCS storage class."
  default     = "STANDARD"

}
