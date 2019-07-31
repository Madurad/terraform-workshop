resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4kOrLGlNvf5ZuZWLB+SJslaO9yjaeyhbgjz3ZBaetGyEQqI69Fu9Sv0Y/zzYKaWE2lbIhAep/iMDKOGdhqU26zdLQsdoGD3NtDbn0xoB6MMgzTK0+AQEtypcK1dJ/NE4MZbPLJoBtwtnvxlqnw5BSmAWQc6E3YYHWq2J+pvvfKSKNvIFQsj5XT3Hs+SZeT5S5ph7HWxQWJJd8sySVCUmQbEGaKGhH7cpMLjJdgqaO0J3wZj+ENmWbM4ZzTwHuMEYTj2oQIt3yEKh+4lXR0x9Al2eA8HnrolHm+dlc6RvtteXX49Gl7cGJbFoHhKWBWtfvdlk3TS2iZN8B4gmUHhdhv8r8PfnTwTF8aHcCC2oaynwzy4ULZcmZqqics0XOQJjNeSGfIwSW3FpLiZyPGbEBQ7VldldXVuRD7+lvk9+8cn554b7aO6jE2P2mFD1x1HCiKFltJ+8LNxdcXI53C8qJq547BT/y4Ooh4J7aSDMn6A0ZC3d8MOkx7yCdrOGyv1iHVjbNMwNZAc5Flu0pel9gkgbUPoYI2lUCwe4l/T5VMkdg89fbDGf1jeJ7xK3dV23M58J3hT1yR5JX3QpUoGAAEr8cZVMeQpqlMsOsX6QWZ62Qi6Sekep9D/uTffo7AdNLDPb4yVSTsjjz2xYfqSL+q1RVAJEbSLrWkXeWK1M+pQ=="
}

resource "aws_instance" "kubectl" {
  ami           = "ami-013be31976ca2c322"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
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
