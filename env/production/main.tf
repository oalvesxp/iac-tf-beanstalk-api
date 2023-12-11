module "staging" {
  source = "../../modules/infra"

  repo_name        = "production"
  repo_description = "application-of-production"
  environment      = "env-production"
  instance_type    = "t2.micro"
  max_size         = 5
}