# Three-Instance Kubernetes Cluster Installation 

## Confirm your AWS cloud

You need to ensure that you have a ~/.aws/credentials that looks like this:
```
[default]
aws_access_key_id = [shorter thing in all caps and numerics]
aws_secret_access_key = [longer thing in mixed case and numerics]
```

This is accomplished through creating a new user in Amazon IAM after you have created your own account.  Automation of this is well beyond the scope of this document.

## Build AWS Infrastructure with Terraform

1. Visit https://www.terraform.io/downloads.html
2. Download the relevant binary
3. For MacOS X, move the binary to a directory specified in your $PATH
4. `cd` into the terraform directory.
5. Execute `terraform init` to download plugins specified in your configuration.
6. Execute `terraform validate` to ensure the source configuration is correct.
7. Execute `terraform plan` to validate the behavior of the terraform code.
8. Execute `terraform apply` to commit the terraform plan to infrastructure. 
9. You may now be charged if your usage exceeds the free tier.  Run `terraform destroy` to destroy everything terraform has done.

## Use Ansible to setup Kubernetes

1. Ensure you have Python 2 and pip on your platform, a topic outside the scope of this document.  Python 3 is not supported.  
2. Install the needed Python packages that Ansible needs.
```
pip install boto
pip install ansible
```
3. Run
```
./ansible/hosts/ec2.py --list
```
to validate that Ansible can use AWS for dynamic inventory.
4. Install Python on CoreOS targets
```
cd ansible 
ansible-playbook python.yaml
```
5. Ping the hosts to verify that they are set up to work with Ansible
```
ansible -m ping all  -e 'ansible_python_interpreter=/home/core/bin/python'
```
6. Install Kubernetes services.
```
ansible-playbook infra.yaml
```
7. If it's not there already, install kubectl on your local machine.
8. Use Ansible to configure your local instance of kubectl.
```
ansible-playbook kubectl.yaml
```
