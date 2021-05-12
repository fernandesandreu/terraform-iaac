data "google_compute_image" "webserver_image" {
  family  = "ubuntu-minimal-2004-lts"
  project = "ubuntu-os-cloud"
}

data "template_file" "user_data" {
  template = file("files/user_data.sh")
}

resource "google_compute_instance" "webserver_instance" {
  name = "webserver-server-${terraform.workspace}"
  machine_type = "e2-medium"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = format("%s/%s",data.google_compute_image.webserver_image.project , data.google_compute_image.webserver_image.family)
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  hostname = "webserver.impacta.com.br"
  labels = {
    "name" = "webserver-server-${terraform.workspace}",
    "project" = "webserver"
  }
  metadata_startup_script = data.template_file.user_data.rendered
}

resource "google_compute_firewall" "webserver_firewall" {
  name    = "webserver-80-${terraform.workspace}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

output "jenkins-server" {
  value = google_compute_instance.webserver_instance 
}

output "gcp_image" {
 value = data.google_compute_image.webserver_image
}
