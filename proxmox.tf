terraform {
    required_providers {
      proxmox = {
          source = "Telmate/proxmox"
          version = "2.9.3"
      }
    }
}
provider "proxmox" {
    pm_api_url = "https://192.168.56.100:8006/api2/json"
    pm_user = "root@pam"
    pm_password = "passwordhere"
}
resource "proxmox_vm_qemu" "jira" {
  name = "jira.local"
  desc = "Jira Server"
  target_node = "pve01"
 
  clone = "ubuntu-1804-cloudinit-template"
 
  cores = 1
  sockets = 1
  memory = 2048
 
  ciuser = "root"
  ipconfig0 = "ip=192.168.56.200/24"
  ipconfig1 = "ip=10.0.2.15/24,gw=10.0.2.2"
 
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbayIeOdJpD+zIaj3/dyayTaqfiJ0N2n7olmTEB9E3SV2JWDUdVELUVrC+FGpTW3J/ZsAo/b1ABprh/rDKuHLMsWgqhKAhTa2I5lI9ea1IxzWinsC6Qp+domXeDj58XLnKhBxL7TOmNLOeEMY4KedMH+z4uQcOVbhoaGcPBL1RGdZVJnBPxYRRRrEoM2+7Ea+4PJnYX6xJeFHP9FRNm/Li0cNToZgirus7V/khoqZiTVPrq2xX791gIRCHK4Ex2rBUbDG0KtJPVZEibAEMXyDA8Vma66axqxe+5ihO/1YwHWwhBK4Gy5af1MNwnKIpl5P/ysn94nT49OUC/RHW5Qr+DGA7tpwT6Hjz9TBtxXQyiXean8ISuPXb3y3r8cSppWoQ06ExS1KlwRqLsYHVCEYz6glOBwtQwxlzXSB1H3e0OLybisjgioFGAzgZn4J03FBcBLyaEE3vVJ2r+8LCUppLmsIvBtWDJZ9/GVVZPPC7xB1sHPYEPo8WtdKGks3LVWk= dan@ubuntu
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCarUWQU6xe2OY3bz7jpap8xkPb8sFPwVTkkNq+VY6OYBlsKfsAfF8RCBAIv0h1xVehVsX24VK2uijI/+/J+apbdGdoT7zU9ToZMa1fHIyFIo0EGxQjAVxQH4khv2haIn8m0wiwqMafiZhGMUiZg8Vp4EsZPaP15BqutFEteRQxKU7TlcMdDBBItp2z0oB0zGlLd8q/MBNtosuU4t8DwY4+lfm6ckstsuWzFvZM43Gi0xczPpsC8BR5l5TV4Ouvcby870GCDex8ZbKjIWMO2E1zVnGvBsm8tayfiyF4+QxsJl4vHfUTSFDUYAn10xxX1LYGLwRSIvV6o2zPsp94o/BA+Ctx5bGaUZrMrZ0nnpveM53fYlnCLQ/qrqa/KrmxzkLolhXyBEvaPmv9nNk8ERj9jarLHDHOsQupYWZuhpZLDVuBFgm2tqj9vszNGnjVEjTMHqefAKWWaHezaoWiGeyEjCvIBhNkFVdPPHwMy/Z9/mIXyWXVphKjYJc/SnrYv/c= dan@darryl
EOF
}
resource "proxmox_vm_qemu" "confluence" {
  name = "confluence.local"
  desc = "Confluence Server"
  target_node = "pve01"
 
  clone = "ubuntu-1804-cloudinit-template"
 
  cores = 4
  sockets = 1
  memory = 2048
 
  ciuser = "root"
  ipconfig0 = "ip=192.168.56.201/24"
  ipconfig1 = "ip=10.0.2.15/24,gw=10.0.2.2"
 
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbayIeOdJpD+zIaj3/dyayTaqfiJ0N2n7olmTEB9E3SV2JWDUdVELUVrC+FGpTW3J/ZsAo/b1ABprh/rDKuHLMsWgqhKAhTa2I5lI9ea1IxzWinsC6Qp+domXeDj58XLnKhBxL7TOmNLOeEMY4KedMH+z4uQcOVbhoaGcPBL1RGdZVJnBPxYRRRrEoM2+7Ea+4PJnYX6xJeFHP9FRNm/Li0cNToZgirus7V/khoqZiTVPrq2xX791gIRCHK4Ex2rBUbDG0KtJPVZEibAEMXyDA8Vma66axqxe+5ihO/1YwHWwhBK4Gy5af1MNwnKIpl5P/ysn94nT49OUC/RHW5Qr+DGA7tpwT6Hjz9TBtxXQyiXean8ISuPXb3y3r8cSppWoQ06ExS1KlwRqLsYHVCEYz6glOBwtQwxlzXSB1H3e0OLybisjgioFGAzgZn4J03FBcBLyaEE3vVJ2r+8LCUppLmsIvBtWDJZ9/GVVZPPC7xB1sHPYEPo8WtdKGks3LVWk= dan@ubuntu
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCarUWQU6xe2OY3bz7jpap8xkPb8sFPwVTkkNq+VY6OYBlsKfsAfF8RCBAIv0h1xVehVsX24VK2uijI/+/J+apbdGdoT7zU9ToZMa1fHIyFIo0EGxQjAVxQH4khv2haIn8m0wiwqMafiZhGMUiZg8Vp4EsZPaP15BqutFEteRQxKU7TlcMdDBBItp2z0oB0zGlLd8q/MBNtosuU4t8DwY4+lfm6ckstsuWzFvZM43Gi0xczPpsC8BR5l5TV4Ouvcby870GCDex8ZbKjIWMO2E1zVnGvBsm8tayfiyF4+QxsJl4vHfUTSFDUYAn10xxX1LYGLwRSIvV6o2zPsp94o/BA+Ctx5bGaUZrMrZ0nnpveM53fYlnCLQ/qrqa/KrmxzkLolhXyBEvaPmv9nNk8ERj9jarLHDHOsQupYWZuhpZLDVuBFgm2tqj9vszNGnjVEjTMHqefAKWWaHezaoWiGeyEjCvIBhNkFVdPPHwMy/Z9/mIXyWXVphKjYJc/SnrYv/c= dan@darryl
EOF
}
