variable "region" {
  default = "us-east-1"
}

variable "intern_user" {
  default = "intern-user"
}

variable "intern-group" {
  default = "intern"
}

variable "intern_policy" {
  default = "InternDevelopmentPolicy"
  description = "Policy for interns to list and manipulate the development server."
}

variable "intern-alias" {
  default = "intern-account"
}