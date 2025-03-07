provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "hello_world" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"  # Imagem de exemplo do Google
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Permitir acesso público ao serviço
resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.hello_world.name
  location = google_cloud_run_service.hello_world.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "service_url" {
  value = google_cloud_run_service.hello_world.status[0].url
}
