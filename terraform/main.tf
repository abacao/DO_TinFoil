provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

resource "digitalocean_droplet" "mywebserver" {
  # Obtain your ssh_key id number via your account. See Document https://developers.digitalocean.com/documentation/v2/#list-all-keys
  ssh_keys           = "${ssh_do_id}"
  image              = "${var.ubuntu}"
  region             = "${var.do_lon1}"
  size               = "512mb"
  private_networking = false
  backups            = false
  ipv6               = false
  name               = "mywebserver-ams3"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install git",
      "git clone https://github.com/tinfoil/openvpn_autoconfig.git",
      "sudo chmod +x openvpn_autoconfig/bin/openvpn.sh",
      "sudo bash -xv openvpn_autoconfig/bin/openvpn.sh",
    ]

    connection {
      type     = "ssh"
      private_key = "${file("~/.ssh/id_rsa")}"
      user     = "root"
      timeout  = "2m"
    }
  }
  provisioner "local-exec" {
    command = "scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@'${digitalocean_droplet.mywebserver.ipv4_address}':/etc/openvpn/client.ovpn vpn.ovpn"
  }
}
