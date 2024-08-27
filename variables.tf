variable "target_ou_id" {
  description = "id of the organization unit to attach the policy to"
  type        = string
}

variable "enable_security_policy" {
  description = "Enables the Security Best Practices SCP"
  type        = bool
  default     = true
}

variable "security_policy_items" {
  description = "Security policy items"
  type = object({
    deny_account_changes                = bool
    deny_billing_changes                = bool
    deny_cloudtrail_changes             = bool
    deny_leaving_orgs                   = bool
    enabled_regions_policy              = bool
    restrict_member_account_root_users  = bool
  })
  default = null
}

variable "enable_infrastructure_policy" {
  description = "Enables the Infrastructure Best Practices SCP"
  type        = bool
  default     = true
}

variable "infrastructure_policy_items" {
  description = "Infrastructure policy items"
  type = object({
    deny_imds_change                              = bool
    deny_s3_public_access                         = bool
    iac_arns_permitted_to_manage_s3_public_access = list(string)
    require_ebs_encryption                        = bool
    require_imdsv2                                = bool
    require_rds_encryption                        = bool
    require_s3_object_encryption                  = bool
    require_s3_bucket_https                       = bool
  })
  default = null
}

variable "enabled_regions" {
  description = "List of regions that are allowed"
  type        = list(string)
}
