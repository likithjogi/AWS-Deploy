# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

region = "us-east-1"
label  = "hashicorp"
app    = "terramino"
bucketname = "likith"
projectName = "testlikith"
s3bucketdescription = "testing storage"

## Virtual Machine
virtualMachineName = "testsrv1"
instainstanceType = "t2.micro"
amiUbuntu = "ami-084568db4383264d4"
vmtags = "Windows Server"
vmtagsDescription = "Windows Test Server"

# Network Details
networkName = "testsrvnw"
NetworkAddress = "172.16.0.0/16"
subnetName = "testsrvsubnet"
SubnetAddress = "172.16.1.0/24"
networkInterfaceName = "testSrvNetworkInterface"
VMprivateIP = "["172.16.10.100"]"