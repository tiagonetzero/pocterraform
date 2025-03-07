variable "project_id" {
  description = "ID do projeto no Google Cloud"
  type        = string
}

variable "region" {
  description = "Região do Google Cloud para deploy"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "Nome do serviço Cloud Run"
  type        = string
  default     = "hello-world-app"
}
