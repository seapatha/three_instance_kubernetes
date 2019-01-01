/* Required variables */
default_keypair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDrHMCPBSgimxzV4b33gSxguxKEAHVZKjAhVMI+GGO6W0xMd45YeFc06wa+B9BtytqSPFx6H/vu6R2ULHpDp9sGjIjcN0TXUmomst0syp+RzDBGPQs4K1c3I9NQcCUrT4f6KGQqQBcp79xQ68FSNN1ZUXUC/MB+mJ6PCsTdH53XCslXdL1hkvxu47GreWMzOho4SInPx6x2OyAHuMAKQV/Q+HMYmtp6qZdCcTojYQdO6cmpm5fRfaJdWC4cXzcv0a3AprkvHWs/LwXgzmo6WTLPP3TBTIGTCkV+ffoNrJCzdhGSA5K8JzEEWEf9XNsw126tol7H0qhcKQxeQ+rYu4TL"

/* CIDR that has access to k8s API */
/* DEFAULT IS MASSIVELY INSECURE, PLEASE TIGHTEN */
control_cidr = "0.0.0.0/0"

/* Optional. Set as desired */
region = "us-west-2"
zone = "us-west-2b"

/*
   If your chosen region above doesn't have a corresponding ami
   in the "amis" variable (found in variables.tf), you can
   override the default below.
*/

/* following AMI is from https://coreos.com/os/docs/latest/booting-on-ec2.html */

amis = { us-west-2 = "ami-0b5fe761216cc15dd" }
