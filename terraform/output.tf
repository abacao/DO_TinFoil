output "Public ip" {
  value = "${digitalocean_droplet.mywebserver.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.mywebserver.name}"
}

output "Hour Price" {
  value = "${digitalocean_droplet.mywebserver.price_hourly}"
}

output "Montly Price" {
  value = "${digitalocean_droplet.mywebserver.price_monthly}"
}
