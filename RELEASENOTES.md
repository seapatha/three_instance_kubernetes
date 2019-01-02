# Release Notes

## Terraform

I decided on terraform because I wanted to keep infrastructure as code that could be developed further rather than the one-time operation of kops.  

I decided against using kops and then capturing the state upon realizing that there are proper ways to do this, but have been solved largely but need adapation to modern demands. 

So I downloaded a pre-existing repo that purported to do most of this and adapted it for my needs.  

## Terraform caveats
- Developing the less complicated version with one master out of the sample as an introduction to Terraform
- Didn't really test what I had before I started.  Probably didn't work
- Error: Unknown root level key: e .  Typo that appeared at the beginning of a line and was hard to search for, especially without line numbers

## Ansible caveats
- Learned the hard way that the ec2.py file included in the original repo was both out of date and didn't support Python 3, failing silently with a false success
- Needed to get python on the target servers

## Kubernetes caveats
- Certificate issues
