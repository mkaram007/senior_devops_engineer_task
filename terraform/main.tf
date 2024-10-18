terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "node" {
  count     = 3
  name      = format("node-%02d", count.index + 1)
  image = "http://localhost:8080/RHEL9.box"
  cpus      = 2
  memory    = "512 mib"

  network_adapter {
    type           = "bridged"
    host_interface = "Realtek RTL8852BE WiFi 6 802.11ax PCIe Adapter"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}

output "IPAddr_3" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 3)
}