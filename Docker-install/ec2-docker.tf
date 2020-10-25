resource "aws_instance" "docker" {
  ami           = "ami-0015b9ef68c77328d"
  count="${var.instance_count}"
  instance_type = "t2.medium"
  key_name = "Incentivio-Common"
  vpc_security_group_ids = ["${aws_security_group.vpc-docker-sg.id}"]
  subnet_id = "${element(var.subnet_ids, count.index)}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "docker"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/docker-install.sh")}"
}
