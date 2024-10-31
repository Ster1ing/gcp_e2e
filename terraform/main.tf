provider "google" {

  # credentials = use gcloud oauth login

  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.username}-${var.environment}-network-${var.app_id}"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "${var.username}-${var.environment}-subnet-${var.app_id}"
  ip_cidr_range = var.network-subnet-cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "default" {
  name           = "${var.username}-${var.environment}-${var.app_name}-${var.app_id}"
  machine_type   = var.linux_instance_type
  zone           = var.gcp_zone
  enable_display = true
  tags           = ["ssh", "http", "https", "rdp"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
      size  = 40
      type  = "pd-ssd" # pd-standard, pd-ssd, pd-balanced

    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id
    access_config {}
  }
  metadata = {
    "ssh-keys" = "otarakanov:${file("${var.ssh_key_path}")}"
  }
}

data "google_client_openid_userinfo" "me" {
}

# generate inventory file for Ansible
resource "local_file" "ansible_hosts" {
  content = templatefile("./templates/hosts.tpl",
    {
      server_ip = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
      username  = "${var.username}"
      ssh_hosts = "${var.ssh_hosts}"
    }
  )
  filename = "../ansible/hosts"
}

# generate config file for SSH Remote VSCode
resource "local_file" "ssh_remote_config" {
  content = templatefile("./templates/remote_ssh_config.tpl",
    {
      server_ip  = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
      ssh_remote = "${var.ssh_remote}"
    }
  )
  filename = "../.ssh/config"
}
