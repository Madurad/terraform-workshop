resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/deployer-key.pem"
  }
  
}

resource "aws_instance" "ansible-server" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.vpc-web-sg.id}"]
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${data.template_file.user_data_template.rendered}"
	tags = {
    	Name = "ansible-server"
  }
}

resource "aws_instance" "ansible-node-A" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.vpc-web-sg.id}"]
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check = false
	tags = {
    	Name = "ansible-node"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/ansible-install.sh")}"
}
