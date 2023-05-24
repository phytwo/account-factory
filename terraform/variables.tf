#########################################
# Control Tower Core Account Parameters
#########################################
variable "ct_management_account_id" {
  description = "Control Tower Management Account Id"
  type        = string
  validation {
    condition     = can(regex("^\\d{12}$", var.ct_management_account_id))
    error_message = "Variable var: ct_management_account_id is not valid."
  }
}
variable "log_archive_account_id" {
  description = "Log Archive Account Id"
  type        = string
  validation {
    condition     = can(regex("^\\d{12}$", var.log_archive_account_id))
    error_message = "Variable var: log_archive_account_id is not valid."
  }
}
variable "audit_account_id" {
  description = "Audit Account Id"
  type        = string
  validation {
    condition     = can(regex("^\\d{12}$", var.audit_account_id))
    error_message = "Variable var: audit_account_id is not valid."
  }
}

variable "aft_management_account_id" {
  description = "AFT Management Account ID"
  type        = string
  validation {
    condition     = can(regex("^\\d{12}$", var.aft_management_account_id))
    error_message = "Variable var: aft_management_account_id is not valid."
  }
}

variable "ct_home_region" {
  description = "The region from which this module will be executed. This MUST be the same region as Control Tower is deployed."
  type        = string
  validation {
    condition     = can(regex("(us(-gov)?|ap|ca|cn|eu|sa|me|af)-(central|(north|south)?(east|west)?)-\\d", var.ct_home_region))
    error_message = "Variable var: region is not valid."
  }
}

variable "tf_backend_secondary_region" {
  type        = string
  description = "AFT creates a backend for state tracking for its own state as well as OSS cases. The backend's primary region is the same as the AFT region, but this defines the secondary region to replicate to."
  validation {
    condition     = var.tf_backend_secondary_region == "" || can(regex("(us(-gov)?|ap|ca|cn|eu|sa|me|af)-(central|(north|south)?(east|west)?)-\\d", var.tf_backend_secondary_region))
    error_message = "Variable var: tf_backend_secondary_region is not valid."
  }
}

#########################################
# Terraform Variables
#########################################

variable "terraform_version" {
  description = "Terraform version being used for AFT"
  type        = string
  default     = "0.15.5"
  validation {
    condition     = can(regex("\\bv?\\d+(\\.\\d+)+[\\-\\w]*\\b", var.terraform_version))
    error_message = "Invalid value for var: terraform_version."
  }
}

variable "terraform_distribution" {
  description = "Terraform distribution being used for AFT - valid values are oss, tfc, or tfe"
  type        = string
  default     = "oss"
  validation {
    condition     = contains(["oss", "tfc", "tfe"], var.terraform_distribution)
    error_message = "Valid values for var: terraform_distribution are (oss, tfc, tfe)."
  }
}

#########################################
# VCS Variables
#########################################

variable "vcs_provider" {
  description = "Customer VCS Provider - valid inputs are codecommit, bitbucket, github, or githubenterprise"
  type        = string
  default     = "github"
  validation {
    condition     = contains(["codecommit", "bitbucket", "github", "githubenterprise"], var.vcs_provider)
    error_message = "Valid values for var: vcs_provider are (codecommit, bitbucket, github, githubenterprise)."
  }
}

variable "account_request_repo_name" {
  description = "Repository name for the account request files. For non-CodeCommit repos, name should be in the format of Org/Repo"
  type        = string
  validation {
    condition     = length(var.account_request_repo_name) > 0
    error_message = "Variable var: account_request_repo_name cannot be empty."
  }
}

variable "global_customizations_repo_name" {
  description = "Repository name for the global customization files. For non-CodeCommit repos, name should be in the format of Org/Repo"
  type        = string
  validation {
    condition     = length(var.global_customizations_repo_name) > 0
    error_message = "Variable var: global_customizations_repo_name cannot be empty."
  }
}

variable "account_customizations_repo_name" {
  description = "Repository name for the account customizations files. For non-CodeCommit repos, name should be in the format of Org/Repo"
  type        = string
  validation {
    condition     = length(var.account_customizations_repo_name) > 0
    error_message = "Variable var: account_customizations_repo_name cannot be empty."
  }
}

variable "account_provisioning_customizations_repo_name" {
  description = "Repository name for the account provisioning customizations files. For non-CodeCommit repos, name should be in the format of Org/Repo"
  type        = string
  validation {
    condition     = length(var.account_provisioning_customizations_repo_name) > 0
    error_message = "Variable var: account_provisioning_customizations_repo_name cannot be empty."
  }
}

#########################################
# AFT Feature Flags
#########################################

variable "aft_feature_cloudtrail_data_events" {
  description = "Feature flag toggling CloudTrail data events on/off"
  type        = bool
  default     = false
  validation {
    condition     = contains([true, false], var.aft_feature_cloudtrail_data_events)
    error_message = "Valid values for var: aft_feature_cloudtrail_data_events are (true, false)."
  }
}
variable "aft_feature_enterprise_support" {
  description = "Feature flag toggling Enterprise Support enrollment on/off"
  type        = bool
  default     = false
  validation {
    condition     = contains([true, false], var.aft_feature_enterprise_support)
    error_message = "Valid values for var: aft_feature_enterprise_support are (true, false)."
  }
}

variable "aft_feature_delete_default_vpcs_enabled" {
  description = "Feature flag toggling deletion of default VPCs on/off"
  type        = bool
  default     = false
  validation {
    condition     = contains([true, false], var.aft_feature_delete_default_vpcs_enabled)
    error_message = "Valid values for var: aft_feature_delete_default_vpcs_enabled are (true, false)."
  }
}

#########################################
# New Relic
#########################################
variable "newrelic_api_key" {
  type = string
}

variable "newrelic_region" {
  type = string
}

variable "newrelic_account_id" {
  type = string
}