resource "aws_instance" "RMQ-1" {
  ami           = "ami-0fc61db8544a617ed"
  count="${var.instance_count}"
  instance_type = "t2.micro"
  key_name = "rmq"
  vpc_security_group_ids = ["${aws_security_group.vpc-web-sg.id}"]
  subnet_id = "${element(var.subnet_ids, count.index)}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "RMQ-${count.index + 1}"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/rmq-install.sh")}"
}
