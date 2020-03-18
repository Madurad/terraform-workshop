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