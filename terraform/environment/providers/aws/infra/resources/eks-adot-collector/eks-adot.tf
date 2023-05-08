# ==========================================================================
#  Resources: EKS-ADOT / eks-cluster.tf (Cluster Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - EKS Cluster Name
#    - EKS Cluster Auth
#    - ADOT Manifest
#    - Helm Installation
# ==========================================================================

data "aws_eks_cluster" "this" {
  name = "${var.eks_cluster_name}-${var.env[local.env]}"
}

data "aws_eks_cluster_auth" "this" {
  name = "${var.eks_cluster_name}-${var.env[local.env]}"
}

resource "kubectl_manifest" "apply" {
  # depends_on = [data.aws_eks_cluster.this, data.aws_eks_cluster_auth.this]
  depends_on = [data.terraform_remote_state.eks_state]

  yaml_body = file("./manifest/addons-otel-permissions.yaml")
}

# Remove this block --- Using HelmChart
# resource "aws_eks_addon" "adot" {
#   depends_on = [kubectl_manifest.apply]
#
#   addon_name   = "adot-collector"
#   cluster_name = local.eks_cluster
#   tags         = local.tags
# }

resource "helm_release" "adot_collector" {
  depends_on = [kubectl_manifest.apply]

  name       = "adot-collector"
  repository = "https://aws-observability.github.io/aws-otel-helm-charts"
  chart      = "adot-exporter-for-eks-on-ec2"
  namespace  = "observability"

  set {
    name  = "serviceAccount.name"
    value = "adot-collector"
  }
  set {
    name  = "serviceAccount.annotations.eks.amazonaws.com/role-arn"
    value = aws_iam_role.adot_collector.arn
  }
}
