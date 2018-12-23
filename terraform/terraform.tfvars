/* Required variables */
default_keypair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2XFn/bOG6Jm3nJ0dBbqvYlzdGNUIqVMjkAwiwQ9EoR7JZH/UKBNS8sRo/4DV4mw56E7cvEEqdCL3Xg1R+IJtGgiHSRD1jTvokEq6tv6uh8yQKukogeQRpdD6sCGj73kmglVGk0TsVnGMc3og8JnlpzoQSlOQ0uz/h6ESkttI0pabQC3vKkJXGUuOdSjz/u3RD9qxNz4pbWLmdR5Jc/V35XYYHHDt3UgqIZVPtBhgyKJ6h8ORg1gqRmF8C250Ob1i7kxGmPWbTa/BWbI45AEau9WeCzz1gpwa3q+gezuBRrSnaKCvollM0XkJhQsbEMnnv9cugw4BPw40ejzVNaw3D"

/* CIDR that has access to k8s API */
/* DEFAULT IS MASSIVELY INSECURE, PLEASE TIGHTEN */
control_cidr = "0.0.0.0/32"

/* Optional. Set as desired */
region = "us-west-2"
zone = "us-west-2b"

/*
   If your chosen region above doesn't have a corresponding ami
   in the "amis" variable (found in variables.tf), you can
   override the default below.
*/

/* following AMI is from https://coreos.com/os/docs/latest/booting-on-ec2.html */

amis = { us-west-2 = "ami-0016c65679adc75f5" }
