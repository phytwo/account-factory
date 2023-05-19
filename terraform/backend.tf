terraform {
  required_version = ">= 0.15.0"
  backend "s3" {
    region         = "eu-west-2"
    bucket         = "aft-backend-psnnsmmextdnxyvm-primary-region"
    key            = "terraform.tfstate"
    dynamodb_table = "aft-backend-psnnsmmextdnxyvm"
    encrypt        = "true"
    kms_key_id     = "4d7e868a-b5a9-4977-87d6-a33ce9ec7672"
  }
}