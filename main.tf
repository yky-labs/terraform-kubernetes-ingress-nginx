# (c) 2023 yky-labs
# This code is licensed under MIT license (see LICENSE for details)

resource "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 1 : 0

  metadata {
    name = var.namespace
  }
}

# https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx

resource "helm_release" "nginx_ingress" {
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
    EOF
  ], var.chart_values)

  depends_on = [
    kubernetes_namespace_v1.this
  ]
}
