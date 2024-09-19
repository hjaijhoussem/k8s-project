resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.24.0" 
  namespace  = "vault"  
  create_namespace = true
  values = [
    <<EOF
server:
  ha:
    enabled: true
EOF
  ]

  set {
    name  = "server.ha.enabled"
    value = "true"
  }

}

