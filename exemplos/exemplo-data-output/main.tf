data "google_compute_image" "jenkins_image" {
  family  = "ubuntu-minimal-2004-lts"
  project = "ubuntu-os-cloud"
}

output "gcp_image" {
 value = data.google_compute_image.jenkins_image
}
