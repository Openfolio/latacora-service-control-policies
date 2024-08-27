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
    deny_account_changes               = optional(bool)
    deny_billing_changes               = optional(bool)
    deny_cloudtrail_changes            = optional(bool)
    deny_leaving_orgs                  = optional(bool)
    enabled_regions_policy             = optional(bool)
    restrict_member_account_root_users = optional(bool)
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
    deny_imds_change                              = optional(bool)
    deny_s3_public_access                         = optional(bool)
    iac_arns_permitted_to_manage_s3_public_access = optional(list(string))
    require_ebs_encryption                        = optional(bool)
    require_imdsv2                                = optional(bool)
    require_rds_encryption                        = optional(bool)
    require_s3_object_encryption                  = optional(bool)
    require_s3_bucket_https                       = optional(bool)
  })
  default = null
}

variable "enabled_regions" {
  description = "List of regions that are allowed"
  type        = list(string)
}
