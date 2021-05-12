data "google_compute_image" "jenkins_image" {
  family  = "ubuntu-minimal-2004-lts"
  project = "ubuntu-os-cloud"
}

data "template_file" "user_data" {
  template = file(format("%s/user_data.sh", path.module))
}

resource "google_compute_instance" "jenkins_instance" {
  name = format("%s-%s", var.project, var.env)
  machine_type = lookup(var.machine_size, var.env)
  zone = var.zone
  boot_disk {
    initialize_params {
      image = format("%s/%s",data.google_compute_image.jenkins_image.project , data.google_compute_image.jenkins_image.family)
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  hostname = format("%s.impacta.com.br", var.project)
  labels = {
    "project" = "iaac"
  }
  metadata = {
    ssh-keys = format("ubuntu:%s", file(format("%s/key.pub", path.module))) 
  }
  metadata_startup_script = data.template_file.user_data.rendered
}

resource "google_compute_firewall" "allow-jenkins" {
  name    = format("allow-%s-%s", var.project, var.env)
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}
