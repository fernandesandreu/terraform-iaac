output "jenkins-server" {
  value = google_compute_instance.jenkins_instance 
}

output "gcp_image" {
 value = data.google_compute_image.jenkins_image
}
