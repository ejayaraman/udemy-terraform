# Variables in Terraform

1. Variables introduced in [variables.tf](variables.tf) with default values.
2. Override default values from command line:
```terraform 
terraform plan -var="<variable-name>=<variable-value>
```
4. Use [terraform.tfvars](terraform.tfvars) file to override default values.
5. Use custom `tfvars` file.This requires passing the file name in command line.
```terraform
terraform plan -var-file="<file_name>.tfvars"
```
5. Use environment variables:
```terraform
export TF_VAR_<variable_name>="<variable_value>"
terraform plan
```

**NOTE:** 
When the same variable is defined in more than one source like `terraform.tfvars` and
in environment variable like `TF_VAR_`, then the order of precedence
defined here is followed: 
https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence