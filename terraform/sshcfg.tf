####################
## Generate ssh.cfg
####################

# Generate ../ssh.cfg
data "template_file" "ssh_cfg" {
    template = "${file("${path.module}/template/ssh.cfg")}"
    depends_on = ["aws_instance.master", "aws_instance.worker"]
    vars {
      user = "${var.default_instance_user}"

      master0_ip = "${aws_instance.master.0.public_ip}"
      worker0_ip = "${aws_instance.worker.0.public_ip}"
      worker1_ip = "${aws_instance.worker.1.public_ip}"
    }
}
resource "null_resource" "ssh_cfg" {
  triggers {
    template_rendered = "${ data.template_file.ssh_cfg.rendered }"
  }
  provisioner "local-exec" {
    command = "echo '${ data.template_file.ssh_cfg.rendered }' > ../ssh.cfg"
  }
}
