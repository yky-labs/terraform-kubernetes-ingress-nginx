# (c) 2023 yky-labs
# This code is licensed under MIT license (see LICENSE for details)

variable "platform" {
  type    = string
  default = "generic"
  validation {
    condition     = contains(["generic", "azure"], var.platform)
    error_message = "Unknown platform."
  }
  description = "The platform to deploy to."
}

variable "name" {
  type        = string
  description = "The deploy name. Used to contextualize the name of the generated resources."
  default     = "ingress-nginx"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace."
  default     = "ingress-nginx"
}

variable "create_namespace" {
  type        = bool
  description = "Create the Kunernetes namespace."
  default     = true
}

variable "chart_version" {
  type        = string
  description = "Helm Chart version."
  default     = null
}

variable "chart_values" {
  type        = list(string)
  description = "Additionals Helm Chart release values."
  default     = []
}

variable "is_default" {
  type        = bool
  description = "Configure as the default Kubernetes ingress class."
  default     = true
}

variable "load_balancer_ip" {
  type        = string
  description = "Used by cloud providers to connect the resulting `LoadBalancer` to a pre-existing static IP according to https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer ."
  default     = null
}
