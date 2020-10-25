resource "aws_instance" "puppet" {
  ami           = "ami-0947d2ba12ee1ff75"
  count="${var.instance_count}"
  instance_type = "t2.small"
  key_name = "Incentivio-Common"
  vpc_security_group_ids = ["${aws_security_group.vpc-puppet-sg.id}"]
  subnet_id = "${element(var.subnet_ids, count.index)}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "puppet"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/puppet-install.sh")}"
}
