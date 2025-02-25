variable "resource_group_id" {
  type        = string
  description = "The id of the IBM Cloud resource group where the resources will be provisioned."
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the resources will be provisioned."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}

variable "tags" {
  type        = list(string)
  description = "The list of tags that will be applied to the OpenVPN vsi instances."
  default     = []
}

variable "vpc_name" {
  type        = string
  description = "The name of the existing VPC instance where the OpenVPN instance(s) will be provisioned."
}

variable "subnet_count" {
  type        = number
  description = "The number of subnets on the vpc instance that will be used for the OpenVPN instance(s)"
}

variable "subnets" {
  type        = list(object({id = string, zone = string, label = string}))
  description = "The list of subnet objects where OpenVPN servers will be provisioned"
}

variable "ssh_key_id" {
  type        = string
  description = "The id of a key registered with the VPC"
}

variable "ssh_private_key" {
  type        = string
  description = "The private key that is paired with ssh_key_id"
}

variable "image_name" {
  type        = string
  default     = "ibm-centos-7-9-minimal-amd64-2"
  description = "Name of the image to use for the OpenVPN instance"
}

variable "profile_name" {
  type        = string
  description = "Virtual Server Instance profile to use for the OpenVPN instance"
  default     = "cx2-2x4"
}

variable "allow_ssh_from" {
  type        = string
  description = "An IP address, a CIDR block, or a single security group identifier to allow incoming SSH connection to the OpenVPN instance"
  default     = "0.0.0.0/0"
}

variable "security_group_rules" {
//  type = list(object({
//    name=string,
//    direction=string,
//    remote=optional(string),
//    ip_version=optional(string),
//    tcp=optional(object({
//      port_min=number,
//      port_max=number
//    })),
//    udp=optional(object({
//      port_min=number,
//      port_max=number
//    })),
//    icmp=optional(object({
//      type=number,
//      code=optional(number)
//    })),
//  }))
  description = "List of security group rules to set on the OpenVPN security group in addition to inbound SSH and VPC and outbound DNS, ICMP, and HTTP(s) rules"
  default = []
}

variable "instance_count" {
  type        = number
  description = "The number of Bastion/jump box instances routable by the OpenVPN server."
}

variable "instance_network_ids" {
  type        = list(string)
  description = "The list of network interface ids for the Bastion/jump box servers."
}
