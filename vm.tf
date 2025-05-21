## VM deploy


#data "aws_ami" "Ubuntu" {
#  executable_users = ["self"]
#  most_recent      = true
#  owners           = ["self"]
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#}




# Network Deploy
resource "aws_vpc" "virtualMachineName" {
  cidr_block = var.NetworkAddress

}

resource "aws_subnet" "subnetName" {
  vpc_id            = aws_vpc.virtualMachineName.id
  cidr_block        = "172.16.10.0/24"
#  availability_zone = "us-west-2a"

}

#resource "aws_network_interface" "virtualMachineName" {
#  subnet_id   = aws_subnet.virtualMachineName.id
#  private_ips = var.VMprivateIP
##  private_ips = ["172.16.10.100"]
#
#  attachment {
#    instance     = aws_instance.virtualMachineName.id
#    device_index = 1
#  }
#
#}


resource "aws_internet_gateway" "virtualMachineName" {
vpc_id = aws_vpc.virtualMachineName.id



tags = {
  Name = "internet_gateway"
}
}

resource "aws_route_table" "virtualMachineName" {
  vpc_id = aws_vpc.virtualMachineName.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.virtualMachineName.id
  }

  tags = {
    Name = "route_tabl"
  }
}


resource "aws_route_table_association" "virtualMachineName" {
  subnet_id      = aws_subnet.subnetName.id
  route_table_id = aws_route_table.virtualMachineName.id
}


#resource "aws_security_group" "ssh" {
#  name   = "allow-all"
#  vpc_id = aws_vpc.virtualMachineName.id
#
#  ingress = {
#    cidr_blocks =["0.0.0.0/0"]
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#  }
#
#  egress  = {
#    from_port = 0
#    to_port = 20
#    protocol = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

resource "aws_key_pair" "virtualMachineName" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRy2ADKhn3H06VfXUrz3NLtVQtmKesVDnvJ7Mr/XDpr3tq0aR8E04522FTl8xbpHmw6FbdbCP0KnYJhMXezJVwVwSb9DgmNLLxHk76Q72ztwKRdK57WeL31JgrmIqgLm0EuD3CA8FOY5TJuvYQiVRSi0mVX6biXzZWzy5cHnLrLPv9RKlFKAGIVUVV4HX5rDXxOsG6luxHR8bjDRgFDeLiXDowJh7dOx7wMnl8yGh+bN8td1U77Ls+j0/qNeJpCX5EhawFrVHJHV/nmf2iAb3aEN9OlVCO5TTmm5pM+xb4oXgyAF5tGbnHBJmqvvLA+Z3uuDfehCX3zqIA+s85BjG3"
}


resource "aws_instance" "virtualMachineName" {
  ami           = var.amiUbuntu
  instance_type = var.instanceType

  tags = {
    Name = var.vmtagsName
    Description = var.vmtagsDescription
  }

associate_public_ip_address = true
key_name = aws_key_pair.virtualMachineName.id
#vpc_security_group_ids = [aws_security_group.ssh.id]
subnet_id = aws_subnet.subnetName.id
#wait_for_fulfillment = true
}