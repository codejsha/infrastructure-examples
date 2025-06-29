######################################################################

### install terraform cli

### homebrew
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

### chocolatey
choco install -y terraform

######################################################################

terraform init
terraform plan
terraform apply
