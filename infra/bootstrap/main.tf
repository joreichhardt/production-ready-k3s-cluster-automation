resource "google_storage_bucket" "tf_state" {
  name                        = var.state_bucket_name
  location                    = "EU"
  uniform_bucket_level_access = true
  force_destroy               = false

  versioning {
    enabled = true
  }
}
