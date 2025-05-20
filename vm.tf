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


resource "aws_instance" "virtualMachineName" {
  ami           = var.amiUbuntu
  instance_type = var.instanceType

  tags = {
    Name = var.vmtagsName
    Description = var.vmtagsDescription
  }
}

# Network Deploy
resource "aws_vpc" "networkName" {
  cidr_block = var.NetworkAddress

  tags {
    Name = var.vmtagsName
  }
}

resource "aws_subnet" "subnetName" {
  vpc_id            = aws_vpc.SubnetAddress.id
  cidr_block        = "172.16.10.0/24"
#  availability_zone = "us-west-2a"

  tags = {
    Name = var.vmtagsName
  }
}

resource "aws_network_interface" "networkInterfaceName" {
  subnet_id   = aws_subnet.SubnetAddress.id
  private_ips = var.VMprivateIP
#  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_internet_gateway" "virtualMachineName" {
vpc_id = aws_vpc.networkName.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.networkName.id
  }

tags = {
  Name = "internet_gateway"
}
}


 resource "aws_route_table_association" "virtualMachineName" {
  subnet_id      = aws_subnet.subnetName.id
  route_table_id = aws_route_table.networkName.id
}


resource "aws_security_group" "ssh" {
  name   = "allow-all"
  vpc_id = aws_vpc.networkName.id

  ingress = {
    cidr_block =[
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress  = {
    from_port = 0
    to_port = 20
    protocol = -1
    cidr_block = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "virtualMachineName" {
  key_name   = "virtualMachineName"
  public_key = "./keys/id_rsa.pub"
}

associate_public_ip_address = true
key_name = aws_key_pair.virtualMachineName.key_name
vpc_security_groups_ids = [aws_security_group.ssh.id]
subnet_id = aws_subnet.subnetName.id
wait_for_fulfillment = true
