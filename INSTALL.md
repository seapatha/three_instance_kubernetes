# Three-Instance Kubernetes Cluster Installation 

## Confirm your AWS cloud

You need to ensure that you have a ~/.aws/credentials that looks like this:
```
[default]
aws_access_key_id = [shorter thing in all caps and numerics]
aws_secret_access_key = [longer thing in mixed case and numerics]
```

This is accomplished through creating a new user in Amazon IAM after you have created your own account.  Automation of this is well beyond the scope of this document.

## Python requirements

Ensure you have Python 2 and pip on your platform, a topic outside the scope of this document.  Python 3 is not supported with Ansible. 

## Build AWS Infrastructure with Terraform
1. Execute `pip install cfssl` to set up Cloudflare's SSL tool that makes certificate management less difficult.
2. Visit https://www.terraform.io/downloads.html
3. Download the relevant binary
4. For MacOS X, move the binary to a directory specified in your $PATH
5. `cd` into the terraform directory.
6. Configure your public SSH key in the terraform.tfvars file.
7. Execute `terraform init` to download plugins specified in your configuration.
8. Execute `terraform validate` to ensure the source configuration is correct.
9. Execute `terraform plan` to validate the behavior of the terraform code.
10. Execute `terraform apply` to commit the terraform plan to infrastructure. 
11. You may now be charged if your usage exceeds the free tier.  Run `terraform destroy` to destroy everything terraform has done.

## Use Ansible to setup Kubernetes

1. Install the Python packages that Ansible needs.
```
pip install boto
pip install ansible
```
2. Change into the ansible directory and run
```
./hosts/ec2.py --list
```
to validate that Ansible can use AWS for dynamic inventory.
3. Install Python on CoreOS targets
```
ansible-playbook python.yaml
```
4. Ping the hosts to verify that they are set up to work with Ansible
```
ansible -m ping all  -e 'ansible_python_interpreter=/home/core/bin/python'
```
5. Install Kubernetes services on the master and worker.
```
ansible-playbook infra.yaml
```
6. If it's not there already, install kubectl on your local machine.  On OS X, it is available via homebrew.
7. Use Ansible to configure your local instance of kubectl.  This will overwrite some of your local configuration.
```
ansible-playbook kubectl.yaml --extra-vars "kubernetes_api_endpoint=$(aws --region=us-west-2 elb describe-load-balancers |grep DNSName |grep 3ik |awk '{print $2}' |sed s#[\",]##g)"
```
8.  Execute `kubectl cluster-info` to verify the cluster health.
