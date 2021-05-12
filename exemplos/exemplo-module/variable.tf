variable "project" {
  type = string
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "machine_size" {
  default = {
      "qa" = "e2-medium",
      "prod" = "e2-small"
  }
}

variable "resource_tags" {
    default = {
       "application_role" = "ci/cd"
    }  
}

variable "env" {
    type = string
}
