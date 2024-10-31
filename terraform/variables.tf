# company name 
variable "company" {
  type        = string
  description = "This variable defines the company name used to build resources"
}

# username 
variable "username" {
  type        = string
  description = "This variable defines the username used to build resources"
}

# application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

# environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# ssh_key_path
variable "ssh_key_path" {
  type        = string
  description = "This variable defines the path to local ssh pub file"
}

# gcp_project
variable "gcp_project" {
  type        = string
  description = "This variable defines the project name"
}

# gcp_region
variable "gcp_region" {
  type        = string
  description = "This variable defines the region"
}

# gcp_zone
variable "gcp_zone" {
  type        = string
  description = "This variable defines the zone"
}

# network-subnet-cidr
variable "network-subnet-cidr" {
  type        = string
  description = "This variable defines the subnet ip range"
}

# linux_instance_type
variable "linux_instance_type" {
  type        = string
  description = "This variable defines the type ov virtual machine"
}

# incremental app id
variable "app_id" {
  type        = string
  description = "This variable defines the incremental id"
}

# ssh path to for hosts generation
variable "ssh_hosts" {
  type        = string
  description = "This variable defines ssh path to for hosts generation"
}

# ssh path to for vscode remote access
variable "ssh_remote" {
  type        = string
  description = "This variable defines ssh path to for vscode remote access"
}