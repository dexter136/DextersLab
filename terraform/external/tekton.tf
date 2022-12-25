resource "kubernetes_secret" "terraform_secrets" {
  metadata {
    name      = "terraform-external-vars"
    namespace = "tekton-pipelines"
  }

  data = {
    "credentials.tfrc.json" = file("~/.terraform.d/credentials.tfrc.json")
    "terraform.tfvars"      = file("${path.root}/terraform.tfvars")
  }
}
