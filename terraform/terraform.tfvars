# Environment tag for all resources being created. You can leave this value as-is.
environment_tag = "dev"

instance_size = {
  Development = "e2-standard-2"
  Qa = "e2-standard-4"
  Production = "e2-standard-8"
}

#project_id = "~/credentials/gcp-project-id"