variable "namespace" {
  description = "Namespace name"
  type        = string
}

variable "inter_broker_username" {
  description = "Inter-broker username for Kafka broker"
  type        = string
  sensitive   = true
}

variable "inter_broker_password" {
  description = "Inter-broker password for Kafka broker"
  type        = string
  sensitive   = true
}

variable "controller_username" {
  description = "Controller username for Kafka broker"
  type        = string
  sensitive   = true
}

variable "controller_password" {
  description = "Controller password for Kafka broker"
  type        = string
  sensitive   = true
}

variable "external_admin_username" {
  description = "External admin username for Kafka broker"
  type        = string
  sensitive   = true
}

variable "external_admin_password" {
  description = "External admin password for Kafka broker"
  type        = string
  sensitive   = true
}
