# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "${var.username}-${var.environment}-fw-allow-http-${var.app_id}"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# allow https
resource "google_compute_firewall" "allow-https" {
  name    = "${var.username}-${var.environment}-fw-allow-https-${var.app_id}"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https"]
}

# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.username}-${var.environment}-fw-allow-ssh-${var.app_id}"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.username}-${var.environment}-fw-allow-rdp-${var.app_id}"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}