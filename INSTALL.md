# Three-Instance Kubernetes Cluster Installation 

## AWS 

You need to ensure that you have a ~/.aws/credentials that looks like this:
```
[default]
aws_access_key_id = [shorter thing in all caps and numerics]
aws_secret_access_key = [longer thing in mixed case and numerics]
```

This is accomplished through creating a new user in Amazon IAM after you have created your own account.  Automation of this is well beyond the scope of this document.

## Download, Initialize, and Validate Terraform

1. Visit https://www.terraform.io/downloads.html
2. Download the relevant binary
3. For MacOS X, move the binary to a directory specified in your $PATH
4. Execute `terraform init` to download plugins specified in your configuration.
5. Execute `terraform validate` to ensure the source configuration is correct.
