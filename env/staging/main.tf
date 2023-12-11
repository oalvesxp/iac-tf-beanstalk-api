module "staging" {
  source = "../../modules/infra"

  repo_name        = "staging"
  repo_description = "application-of-staging"
  environment      = "env-staging"
  instance_type    = "t2.micro"
  max_size         = 1
}