resource "aws_vpc" "inc-dev-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags {
    Name = "inc-dev-vpc"
  }
}

resource "aws_internet_gateway" "inc-dev-int-gw" {
	vpc_id = "${aws_vpc.inc-dev-vpc.id}"
	tags {
		Name = "inc-dev-int-gw"
	}
}

resource "aws_subnet" "inc-dev-subnet-pub-1" {
  vpc_id     = "${aws_vpc.inc-dev-vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "inc-dev-subnet-pub-1"
  }
}

resource "aws_subnet" "inc-dev-subnet-pub-2" {
  vpc_id     = "${aws_vpc.inc-dev-vpc.id}"
  cidr_block = "${var.public_subnet_cidr_2}"
  availability_zone = "us-east-1b"
  tags {
    Name = "inc-dev-subnet-pub-2"
  }
}


resource "aws_subnet" "inc-dev-subnet-pri-1" {
  vpc_id     = "${aws_vpc.inc-dev-vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "inc-dev-subnet-pri-1"
  }
}

resource "aws_subnet" "inc-dev-subnet-pri-2" {
  vpc_id     = "${aws_vpc.inc-dev-vpc.id}"
  cidr_block = "${var.private_subnet_cidr_2}"
  availability_zone = "us-east-1b"
  tags {
    Name = "inc-dev-subnet-pri-2"
  }
}