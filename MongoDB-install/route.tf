resource "aws_route_table" "inc-dev-rt-pub" {
	vpc_id = "${aws_vpc.inc-dev-vpc.id}"

	route{
		cidr_block = "0.0.0.0/0"
		//cidr_block = "${var.public_subnet_cidr}"
		gateway_id = "${aws_internet_gateway.inc-dev-int-gw.id}"
	}
	tags {
		Name = "inc-dev-route-table-pub"
	}
}

resource "aws_route_table_association" "inc-dev-rt-pub-association" {
	subnet_id = "${aws_subnet.inc-dev-subnet-pub-1.id}"
	subnet_id = "${aws_subnet.inc-dev-subnet-pub-2.id}"
	route_table_id = "${aws_route_table.inc-dev-rt-pub.id}"
}

resource "aws_route_table" "inc-dev-rt-pri" {
	vpc_id = "${aws_vpc.inc-dev-vpc.id}"

	route{
		cidr_block = "0.0.0.0/0"
		//cidr_block = "${var.private_subnet_cidr}"
		instance_id = "${aws_instance.mongodb.id}"
	}
	tags {
		Name = "inc-dev-rt-pri"
	}
}

resource "aws_route_table_association" "inc-dev-rt-pri-association" {
	subnet_id = "${aws_subnet.inc-dev-subnet-pri-1.id}"
	subnet_id = "${aws_subnet.inc-dev-subnet-pri-2.id}"
	route_table_id = "${aws_route_table.inc-dev-rt-pri.id}"
}
