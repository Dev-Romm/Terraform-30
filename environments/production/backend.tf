terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-rommy"
    key            = "environments/production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
