locals {
  security_policy       = var.enable_security_policy ? 1 : 0
  infrastructure_policy = var.enable_infrastructure_policy ? 1 : 0
}

module "security_scp" {
  count           = local.security_policy
  source          = "./policy-groups/security-best-practices/"
  target_ou_id    = var.target_ou_id
  enabled_regions = var.enabled_regions

  deny_account_changes                = var.security_policy_items.deny_account_changes
  deny_billing_changes                = var.security_policy_items.deny_billing_changes
  deny_cloudtrail_changes             = var.security_policy_items.deny_cloudtrail_changes
  deny_leaving_orgs                   = var.security_policy_items.deny_leaving_orgs
  enabled_regions_policy              = var.security_policy_items.enabled_regions_policy
  restrict_member_account_root_users  = var.security_policy_items.restrict_member_account_root_users
}

module "infrastructure_scp" {
  count        = local.infrastructure_policy
  source       = "./policy-groups/infrastructure-best-practices/"
  target_ou_id = var.target_ou_id

  deny_imds_change                              = var.infrastructure_policy_items.deny_imds_change
  deny_s3_public_access                         = var.infrastructure_policy_items.deny_s3_public_access
  iac_arns_permitted_to_manage_s3_public_access = var.infrastructure_policy_items.iac_arns_permitted_to_manage_s3_public_access
  require_imdsv2                                = var.infrastructure_policy_items.require_imdsv2
  require_rds_encryption                        = var.infrastructure_policy_items.require_rds_encryption
  require_ebs_encryption                        = var.infrastructure_policy_items.require_ebs_encryption
  require_s3_bucket_https                       = var.infrastructure_policy_items.require_s3_bucket_https
  require_s3_object_encryption                  = var.infrastructure_policy_items.require_s3_object_encryption
}
