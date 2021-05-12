variable "env" {
    type = string
}

variable "size" {
    type = map
    default = {
       "qa" = "Large",
       "dev" = "small"
    } 
}

output "ambiente"{
    value = lookup(var.size, var.env)
}
