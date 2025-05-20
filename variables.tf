# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT


# Region
variable "region" {
  type        = string
  description = "AWS region for all resources."
}

# EC2
variable "virtualMachineName" {
  type        = string
  description = "Virtual Machine"
}

variable "amiUbuntu" {
  type        = string
  description = "type of image or OS deployed"
}

#variable "ownerID" {
#  type        = Number
#  description = "type of image or OS deployed"
#}

variable "instanceType" {
  type        = string
  description = "type of instance deployed"
}

variable "vmtagsName" {
  type        = string
  description = "Tag of the Resource."
}

variable "vmtagsDescription" {
  type        = string
  description = "Description of tag Resource."
}


# Network

variable "networkName" {
  type        = string
  description = "VM Network Name."
}

variable "NetworkAddress" {
  type        = string
  description = "VM Network Name."
}

variable "subnetName" {
  type        = string
  description = "VM Network Name."
}


variable "SubnetAddress" {
  type        = string
  description = "VM Network Name."
}

variable "networkInterfaceName" {
  type        = string
  description = "Name of the Network Interface."
}

variable "VMprivateIP" {
  type        = string
  description = "Name of the Network Interface."
}
























variable "bucketname" {
  type        = string
  description = "bucketname."
}

variable "projectname" {
  type        = string
  description = "projectname."
}

variable "s3bucketdescription" {
  type        = string
  description = "testing storage."
}