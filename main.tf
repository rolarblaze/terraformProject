resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "jenkins_public_subet" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "10.0.0.0/16"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
}

resource "aws_internet_gateway" "jenkins_internet_gateway" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jenkins-igw"
  }

}

resource "aws_route_table" "jenkins_public_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    "Name" = "public-route-table"
  }

}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.jenkins_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.jenkins_internet_gateway.id

}