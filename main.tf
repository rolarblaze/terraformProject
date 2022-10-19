resource "aws_vpc" "jenkins_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "dev"
    }
}

resource "aws_subnet" "jenkins_public_subet" {
    vpc_id = aws_vpc.jenkins_vpc.id
    cidr_block = "10.0.0.0/16"
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"
}

