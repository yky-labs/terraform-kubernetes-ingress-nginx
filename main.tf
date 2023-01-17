# (c) 2023 yky-labs
# This code is licensed under MIT license (see LICENSE for details)

resource "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 1 : 0

  metadata {
    name = var.namespace
  }
}

# https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx
# https://learn.microsoft.com/en-us/azure/aks/ingress-basic?tabs=azure-cli
# https://learn.microsoft.com/en-us/azure/aks/ingress-tls?tabs=azure-cli#use-a-static-public-ip-address

resource "helm_release" "this" {
  namespace  = local.namespace
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  name       = var.name
  version    = var.chart_version
  values = concat([
    <<-EOF
    controller:
      ingressClassResource:
        default: "${var.is_default}"
      service:
        loadBalancerIP: ${coalesce(var.load_balancer_ip, "null")}

        %{~ if var.platform == "azure" ~}
        annotations:
          service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path: /healthz
        %{~ endif ~}

    EOF
  ], var.chart_values)

  depends_on = [
    kubernetes_namespace_v1.this
  ]
}
