variable control_cidr {
  description = "CIDR for maintenance: inbound traffic will be allowed from this IPs"
}

variable default_keypair_public_key {
  description = "Public Key of the default keypair"
}

variable default_keypair_name {
  description = "Name of the KeyPair used for all nodes"
  default = "three_instance_kubernetes"
}

variable vpc_name {
  description = "Name of the VPC"
  default = "3ik"
}

variable elb_name {
  description = "Name of the ELB for Kubernetes API"
  default = "3ik"
}

variable owner {
  default = "Kubernetes"
}

variable ansibleFilter {
  description = "`ansibleFilter` tag value added to all instances, to enable instance filtering in Ansible dynamic inventory"
  default = "Kubernetes01" # IF YOU CHANGE THIS YOU HAVE TO CHANGE instance_filters = tag:ansibleFilter=Kubernetes01 in ./ansible/hosts/ec2.ini
}

# Networking setup
variable region {
  default = "eu-west-2"
}

variable zone {
  default = "eu-west-2b"
}

variable amis {
   description = "Default AMIs to use for nodes depending on the region"
   type = "map"
}

### VARIABLES BELOW MUST NOT BE CHANGED ###

variable vpc_cidr {
  default = "10.43.0.0/16"
}

variable kubernetes_pod_cidr {
  default = "10.200.0.0/16"
}

variable default_instance_user {
  default = "core"
}

variable master_instance_type {
  default = "t2.micro"
}

variable worker_instance_type {
  default = "t2.micro"
}

variable kubernetes_cluster_dns {
  default = "10.31.0.1"
}
