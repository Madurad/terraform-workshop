resource "aws_instance" "kubectl" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "deployer-key"
  vpc_security_group_ids = ["sg-0756d6f9c61876984"]
  subnet_id = "subnet-0e52b67be1003891c"
  associate_public_ip_address = true
  source_dest_check = false
  //depends_on = ["aws_s3_bucket.my-s3-bucket-madura-redis"]
  user_data = "${data.template_file.user_data_template.rendered}"
	tags {
    	Name = "kubectl"
  }
}

resource "aws_eip" "kubectl-eip" {
  instance = "${aws_instance.kubectl.id}"
  vpc      = true
  tags {
    	Name = "kubectl-eip"
  }
}

data "template_file" "user_data_template" {
  template = "${file("files/tools-install.sh")}"
}
