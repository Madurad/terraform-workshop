resource "aws_elastic_beanstalk_application" "INC-DEV-LOYALTY-DOMAIN" {
    name = "INC-DEV-LOYALTY-DOMAIN"
    description = "Beanstalk Docker environment for inc-dev-loyalty-domain"
  
}

resource "aws_elastic_beanstalk_environment" "inc-dev-loyalty-boot" {
    name = "inc-dev-loyalty-boot"
    application = "${aws_elastic_beanstalk_application.INC-DEV-LOYALTY-DOMAIN.name}"
    solution_stack_name = "64bit Amazon Linux 2018.03 v2.15.0 running Docker 19.03.6-ce"

    setting {
        namespace = "aws:ec2:vpc"
        name = "VPCId"
        value = "vpc-0f6cc839eb5c88c93"
    }

    setting {
        namespace = "aws:ec2:vpc"
        name = "Subnets"
        value = "subnet-0ebd8611f06d90739", "subnet-09ffc172db7eae1d7"
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "InstanceType"
        value = "t2.micro"
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "EC2KeyName"
        value = "beanstalk"
    }
  
}

