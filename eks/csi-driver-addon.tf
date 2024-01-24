resource "aws_eks_addon" "csi_driver" {
  cluster_name             = var.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.16.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks_ebs_csi_driver.arn
  depends_on = [module.eks]
}