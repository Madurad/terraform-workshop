resource "aws_route_table" "my-route-table-pub" {
	vpc_id = "${aws_vpc.my-vpc.id}"

	route{
		cidr_block = "0.0.0.0/0"
		//cidr_block = "${var.public_subnet_cidr}"
		gateway_id = "${aws_internet_gateway.my-int-gw.id}"
	}
	tags {
		Name = "my-route-table-pub"
	}
}

resource "aws_route_table_association" "my-route-table-pub-association" {
	subnet_id = "${aws_subnet.my-subnet-pub-1.id}"
	route_table_id = "${aws_route_table.my-route-table-pub.id}"
}

resource "aws_route_table" "my-route-table-pri" {
	vpc_id = "${aws_vpc.my-vpc.id}"

	route{
		cidr_block = "0.0.0.0/0"
		//cidr_block = "${var.private_subnet_cidr}"
		instance_id = "${aws_instance.jenkins-cli.id}"
	}
	tags {
		Name = "my-route-table-pri"
	}
}

resource "aws_route_table_association" "my-route-table-pri-association" {
	subnet_id = "${aws_subnet.my-subnet-pri-1.id}"
	subnet_id = "${aws_subnet.my-subnet-pri-2.id}"
	route_table_id = "${aws_route_table.my-route-table-pri.id}"
}
