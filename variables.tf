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
    deny_account_changes               = optional(bool, true)
    deny_billing_changes               = optional(bool, true)
    deny_cloudtrail_changes            = optional(bool, true)
    deny_leaving_orgs                  = optional(bool, true)
    enabled_regions_policy             = optional(bool, true)
    restrict_member_account_root_users = optional(bool, true)
  })
}

variable "enable_infrastructure_policy" {
  description = "Enables the Infrastructure Best Practices SCP"
  type        = bool
  default     = true
}

variable "infrastructure_policy_items" {
  description = "Infrastructure policy items"
  type = object({
    deny_imds_change                              = optional(bool, true)
    deny_s3_public_access                         = optional(bool, true)
    iac_arns_permitted_to_manage_s3_public_access = optional(list(string), [])
    require_ebs_encryption                        = optional(bool, true)
    require_imdsv2                                = optional(bool, true)
    require_rds_encryption                        = optional(bool, true)
    require_s3_object_encryption                  = optional(bool, true)
    require_s3_bucket_https                       = optional(bool, true)
  })
}

variable "enabled_regions" {
  description = "List of regions that are allowed"
  type        = list(string)
}
