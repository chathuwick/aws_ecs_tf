# Define our VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "test-vpc"
  }
}

# Define the public subnets
resource "aws_subnet" "public-subnet01" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr01}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags {
    Name = "CCP Public Subnet 01"
  }
}

resource "aws_subnet" "public-subnet02" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr02}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags {
    Name = "CCP Public Subnet 02"
  }
}

# Define the private subnets
resource "aws_subnet" "private-subnet01" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr01}"
  availability_zone = "us-east-1a"

  tags {
    Name = "CCP Private Subnet 01"
  }
}

resource "aws_subnet" "private-subnet02" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr02}"
  availability_zone = "us-east-1b"

  tags {
    Name = "CCP Private Subnet 02"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}

# Define the Public route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnets
resource "aws_route_table_association" "web-public-rt01" {
  subnet_id = "${aws_subnet.public-subnet01.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

resource "aws_route_table_association" "web-public-rt02" {
  subnet_id = "${aws_subnet.public-subnet02.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

# Define EIP for Nat Gateways
resource "aws_eip" "eip-nat01" {
}

resource "aws_eip" "eip-nat02" {
}

#Define NAT gateways
resource "aws_nat_gateway" "nat01" {
  allocation_id = "${aws_eip.eip-nat01.id}"
  subnet_id     = "${aws_subnet.public-subnet01.id}"

  tags {
    Name = "CCP NAT01"
  }
}

resource "aws_nat_gateway" "nat02" {
  allocation_id = "${aws_eip.eip-nat02.id}"
  subnet_id     = "${aws_subnet.public-subnet02.id}"

  tags {
    Name = "CCP NAT02"
  }
}

# Define the Private route tables

resource "aws_route_table" "privare-RTB01" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat01.id}"
  }

  tags {
    Name = "CCP Privare RTB01"
  }
}

resource "aws_route_table" "privare-RTB02" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat02.id}"
  }

  tags {
    Name = "CCP Privare RTB02"
  }
}

# Assign the Pri route table to the private Subnets
resource "aws_route_table_association" "privare-RTB01" {
  subnet_id = "${aws_subnet.private-subnet01.id}"
  route_table_id = "${aws_route_table.privare-RTB01.id}"
}

resource "aws_route_table_association" "privare-RTB02" {
  subnet_id = "${aws_subnet.private-subnet02.id}"
  route_table_id = "${aws_route_table.privare-RTB02.id}"
}
