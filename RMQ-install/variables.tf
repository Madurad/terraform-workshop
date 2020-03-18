variable "key_name_ex" {
	description = "Key name for SSHing into EC2"
	default = "R_&_D_Key"
}

variable "key_path" {
	description = "Default authentication key"
	default = "/Users/madura/Documents/Aeturnum/GLX/R_&_D_Key.pem"
}

variable "region" {
	description = "Default region in the AWS"
	default = "us-east-1"
}

variable "vpc_cidr" {
	description = "CIDR block for VPC"
	default = "10.101.0.0/16"
}

variable "public_subnet_cidr" {
	description = "CIDR block for Public Subnet"
	default = "10.101.1.0/24"
}

variable "private_subnet_cidr" {
	description = "CIDR block for Private Subnet"
	default = "10.101.2.0/24"
}

variable "private_subnet_cidr_2" {
	description = "CIDR block for Private Subnet 2"
	default = "10.101.3.0/24"
}