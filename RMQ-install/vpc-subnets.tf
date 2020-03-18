resource "aws_vpc" "my-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags {
    Name = "my-vpc"
  }
}

resource "aws_internet_gateway" "my-int-gw" {
	vpc_id = "${aws_vpc.my-vpc.id}"
	tags {
		Name = "my-int-gw"
	}
}

resource "aws_subnet" "my-subnet-pub-1" {
  vpc_id     = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "my-subnet-pub-1"
  }
}

resource "aws_subnet" "my-subnet-pri-1" {
  vpc_id     = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "my-subnet-pri-1"
  }
}

resource "aws_subnet" "my-subnet-pri-2" {
  vpc_id     = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.private_subnet_cidr_2}"
  availability_zone = "us-east-1b"
  tags {
    Name = "my-subnet-pri-2"
  }
}