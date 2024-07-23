# variable "location" {
#   description = "The location in which to create the resources"
#   type        = string

#   default = "australiaeast"

#   validation {
#     condition     = contains(["australiaeast", "australiasoutheast"], var.location)
#     error_message = "Location must be either 'australiaeast' or 'australiasoutheast'"
#   }
# }

# variable "service_code" {
#   description = "The service code for the deployment"
#   type        = string
# }

# variable "context_code" {
#   description = "The context code for the deployment"
#   type        = string
# }

# variable "environment" {
#   description = "The environment for the deployment"
#   type        = string
# }

# variable "environment_code" {
#   description = "The environment code for the deployment"
#   type        = string
# }

# variable "billing_code" {
#   description = "The billing code for the deployment"
#   type        = string
# }

variable "configuration_path" {
  description = "The path to the configuration file"
  type        = string
}
