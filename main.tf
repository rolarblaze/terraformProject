resource "aws_vpc" "jenkins_vpc" {
    cidr_block = "10.123.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "dev"
    }
}

resource "aws_vpc" "jenkins_vpc_pubsubnet" {
    
  
}