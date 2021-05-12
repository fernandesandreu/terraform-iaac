data "template_file" "user_data" {
    template = file("./vm/user_data.sh")
    vars = {
          curso = var.curso
          pacotes = join(" ",var.pacotes)

    }
}

data "template_file" "policy" {
    template = file("./vm/policy.json")
    count = length(var.endpoints)
    vars = {
        endpoint = element(values(var.endpoints[count.index]), 0)
        nome = element(keys(var.endpoints[count.index]), 0)
    }
}

data "template_file" "policy_join" {
    template = file("./vm/policy-join.json")
    vars = {
      "value" = join(",", data.template_file.policy.*.rendered)
    } 
}

output "user_data" {
    value = data.template_file.user_data.rendered
}

output "policy" {
    value = data.template_file.policy.*.rendered
}

output "policy_joined" {
    value = data.template_file.policy_join.rendered
}
