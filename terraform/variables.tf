variable "project_name" {
    default         = "inventory-dashboard"
}

variable "db_password" {
    type = string
    sensitive = true
}

variable "db_username" {
    default = "dbadmin"
}