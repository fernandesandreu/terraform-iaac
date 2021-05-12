variable "pacotes" {
type = list(string)
default = ["us-central1-a","us-central1-b","us-central1-c"]
}

variable "curso" {
type = string
}

variable "endpoints" {
default = [
{
"home" = "http://localhost/home"
},
{
"contato" = "http://localhost/contato"
}
]
}
