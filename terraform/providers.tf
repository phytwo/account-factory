provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "aft_management"
  region = var.ct_home_region
  default_tags {
    tags = {
      managed_by = "AFT"
    }
  }
}

provider "aws" {
  alias  = "tf_backend_secondary_region"
  region = var.tf_backend_secondary_region
  default_tags {
    tags = {
      managed_by = "AFT"
    }
  }
}