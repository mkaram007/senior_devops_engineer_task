#!/bin/bash
sudo nmcli con add con-name tf-con type ethernet ipv4.method manual ipv4.addresses 192.168.252.100/24 ipv4.gateway 192.168.252.159 ipv4.dns 8.8.8.8
sudo nmcli con up tf-con