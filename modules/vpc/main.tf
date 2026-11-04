# --- VPC ---
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

# --- Internet Gateway ---
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# ==========================================
# Availability Zone 1 (AZ1)
# ==========================================

# Public Subnet AZ1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr_block
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name                     = "public-subnet-1"
  }
}

# Private Subnet AZ1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name                              = "private-subnet-1"
  }
}

# Elastic IP for NAT Gateway AZ1
resource "aws_eip" "nat_eip_1" {
  domain = "vpc"

  tags = {
    Name = "nat-eip-1"
  }
}

# NAT Gateway AZ1
resource "aws_nat_gateway" "nat_gw_1" {
  subnet_id     = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.nat_eip_1.id

  tags = {
    Name = "nat-gw-1"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Private Route Table AZ1 (routes 0.0.0.0/0 to NAT GW 1)
resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1.id
  }

  tags = {
    Name = "private-route-table-1"
  }
}

# Private Route Table Association AZ1
resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

# ==========================================
# Availability Zone 2 (AZ2)
# ==========================================

# Public Subnet AZ2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr_block
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name                     = "public-subnet-2"
    "kubernetes.io/role/elb" = "1"
  }
}

# Private Subnet AZ2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name                              = "private-subnet-2"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

# Elastic IP for NAT Gateway AZ2
resource "aws_eip" "nat_eip_2" {
  domain = "vpc"

  tags = {
    Name = "nat-eip-2"
  }
}

# NAT Gateway AZ2
resource "aws_nat_gateway" "nat_gw_2" {
  subnet_id     = aws_subnet.public_subnet_2.id
  allocation_id = aws_eip.nat_eip_2.id

  tags = {
    Name = "nat-gw-2"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Private Route Table AZ2 (routes 0.0.0.0/0 to NAT GW 2)
resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_2.id
  }

  tags = {
    Name = "private-route-table-2"
  }
}

# Private Route Table Association AZ2
resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}

# ==========================================
# Public Routing (Shared Route Table to IGW)
# ==========================================

resource "aws_route_table" "public_subnet_routing" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_subnet_routing.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_subnet_routing.id
}
