# Configuração do backend remoto
remote_state {
  backend = "gcs"
  config = {
    bucket   = "compwire-interno-terraform-state"
    prefix   = "terraform.tfstate"
    project  = "compwire-interno"
    location = "us-central1"
  }
}

# Referência ao código Terraform
terraform {
  source = "./"
}

# Variáveis para o Terraform
inputs = {
  project_id   = "compwire-interno"
  region       = get_env("TF_VAR_region", "us-central1")
  service_name = get_env("TF_VAR_service_name", "hello-world-app")
}
