# add a default value that is at least 16 characters
variable "masterAuthPass" {
  type = "string"
}

variable "masterAuthUser" {
  type = "string"
}

#variable "serviceAccount" {
#  type = "string"
#}

variable "project" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "zone" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
}

variable "node_count" {
  type = "string"
  default = "4"
}
