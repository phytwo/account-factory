module "backend" {
  providers = {
    aws.primary_region   = aws.aft_management
    aws.secondary_region = aws.tf_backend_secondary_region
  }
  source           = "./modules/backend"
  primary_region   = var.ct_home_region
  secondary_region = var.tf_backend_secondary_region
}

module "aft_pipeline" {
  source = "github.com/phytwo/control_tower_account_factory"
  # Required Variables
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  # Terraform variables
  terraform_version      = var.terraform_version
  terraform_distribution = var.terraform_distribution

  # VCS variables
  vcs_provider                                  = var.vcs_provider
  account_request_repo_name                     = var.account_request_repo_name
  global_customizations_repo_name               = var.global_customizations_repo_name
  account_customizations_repo_name              = var.account_customizations_repo_name
  account_provisioning_customizations_repo_name = var.account_provisioning_customizations_repo_name

  # AFT Feature flags
  aft_feature_cloudtrail_data_events      = var.aft_feature_cloudtrail_data_events
  aft_feature_enterprise_support          = var.aft_feature_enterprise_support
  aft_feature_delete_default_vpcs_enabled = var.aft_feature_delete_default_vpcs_enabled
}