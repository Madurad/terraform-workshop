resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa xxxxxxxxxx"
}

resource "aws_instance" "jenkins-cli" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.vpc-web-sg.id}"]
  subnet_id = "${aws_subnet.my-subnet-pub-1.id}"
  associate_public_ip_address = true
  source_dest_check = false
  //depends_on = ["aws_s3_bucket.my-s3-bucket-madura-redis"]
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "jenkins-cli"
  }
}

resource "aws_eip" "jenkins-cli-eip" {
  instance = "${aws_instance.jenkins-cli.id}"
  vpc      = true
  tags {
    	Name = "jenkins-cli-eip"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/jenkins-install.sh")}"
}
