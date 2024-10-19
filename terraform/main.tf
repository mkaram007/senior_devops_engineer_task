terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "node-01" {
  count     = 1
  name      = "node-01"
  image = "http://localhost:8080/RHEL9.box"
  cpus      = 2
  memory    = "4 gib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek RTL8852BE WiFi 6 802.11ax PCIe Adapter"
  }

}

resource "virtualbox_vm" "node-02" {
  count     = 1
  name      = "node-02"
  image = "http://localhost:8080/RHEL9.box"
  cpus      = 2
  memory    = "4 gib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek RTL8852BE WiFi 6 802.11ax PCIe Adapter"
  }
}

resource "virtualbox_vm" "node-03" {
  count     = 1
  name      = "node-03"
  image = "http://localhost:8080/RHEL9.box"
  cpus      = 2
  memory    = "4 gib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek RTL8852BE WiFi 6 802.11ax PCIe Adapter"
  }
  connection {
    type = "ssh"
    host = self.network_adapter[0].ipv4_address
    user = "vagrant"
    private_key = file("C:\\Users\\mkaram\\.vagrant.d\\insecure_private_key")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo nmcli con add con-name tf-con type ethernet ipv4.method manual ipv4.addresses 192.168.252.100/24 ipv4.gateway 192.168.252.159 ipv4.dns 8.8.8.8",
      "sudo nmcli con up tf-con"

    ]
  }
}


output "IPAddr" {
  value = element(virtualbox_vm.node-01.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node-02.*.network_adapter.0.ipv4_address, 2)
}

output "IPAddr_3" {
  value = element(virtualbox_vm.node-03.*.network_adapter.0.ipv4_address, 3)
}
