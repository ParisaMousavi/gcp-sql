variable "server_name" {
  type = string
}
variable "region" {
  type    = string
  default = null
}

variable "database_version" {
  type    = string
  default = "MYSQL_8_0"
}

variable "settings" {
  type = object({
    tier = string
  })
  default = {
    tier = "db-f1-micro"
  }
}

variable "databases" {
  type = list(object({
    name = string
  }))
}
