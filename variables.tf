# (c) 2023 yky-labs
# This code is licensed under MIT license (see LICENSE for details)

variable "name" {
  type        = string
  description = "The deploy name. Used to contextualize the name of the generated resources."
  default     = "ingress-nginx"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace name."
  default     = "kube-system"
}

variable "create_namespace" {
  type        = bool
  description = "Create the Kunernetes namespace."
  default     = false
}

variable "chart_version" {
  type        = string
  description = "Helm Chart version."
  default     = "4.4.2"
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
