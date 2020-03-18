resource "aws_instance" "RMQ-1" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "rmq"
  vpc_security_group_ids = ["${aws_security_group.vpc-web-sg.id}"]
  subnet_id = "subnet-b35534f9"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "jenkins-cli"
  }
}

resource "aws_eip" "rmq-eip" {
  instance = "${aws_instance.jenkins-cli.id}"
  vpc      = true
  tags {
    	Name = "rmq-eip"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/rmq-install.sh")}"
}
