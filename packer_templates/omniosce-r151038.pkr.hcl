source "virtualbox-iso" "omniosce-r151038" {
    boot_command     = [
        "<enter><wait5>", // Select default keyboard layout
        "<enter><wait5>", // Enter find disk menu
        "<spacebar><enter><wait5>", // Select first disk as rpool
        "0<enter><wait5>",  // Accept rpool informations
        "<bs><bs><bs><bs><bs><bs>r151038", // Change system hostname
        "<enter><wait><enter><wait1>", // Select default UTC timezone
        "<enter><wait1>", // Proceed with ZFS installation
        "<wait55>", // Wait for installation
        "<enter><wait1>", // Continue after installation complete
        "1<enter><wait1>", // Enter in configure menu
        "1<enter><wait1>2<enter><wait1><enter><wait1>", // Setup DHCP networking
        "2<enter><wait1>admin<down>admin<down>admin<enter><wait1>", // Create user admin
        "<down><spacebar><enter><wait1>", // Select bash shell (1:Korn 2:Bash 3:Csh)
        "<down><spacebar><down><spacebar><enter><wait1><enter><wait1>", // Grant sudo without password to admin
        "3<enter><wait1>toor<down>toor<enter><wait1><enter><wait1>", // Setup root password
        "4<enter><wait1>", // Enable SSH server
        "8<enter><wait1>", // Return to main menu
        "3<enter>", // Reboot the machine
        "<wait60>" // Wait for reboot
    ]
  boot_wait        = "45s"
  disk_size        = 40960
  guest_os_type    = "OpenSolaris_64"
  headless         = "false"
  iso_checksum     = "file:https://downloads.omnios.org/media/r151038/omnios-r151038an.iso.sha256"
  iso_url          = "https://downloads.omnios.org/media/r151038/omnios-r151038an.iso"
  shutdown_command = "pfexec /usr/sbin/shutdown -g 0 -y -i 5"
  ssh_password     = "admin"
  ssh_username     = "admin"
  ssh_port	   = 22

  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "2048"],
    ["modifyvm", "{{.Name}}", "--cpus", "2"],
    ["storagectl", "{{.Name}}", "--name", "SATA Controller", "--add", "sata"],
    ["createhd", "--filename", "{{.Name}}-data-pool.vdi", "--size", "40960"],
    ["storageattach", "{{.Name}}", "--storagectl", "SATA Controller", "--type", "hdd",
        "--medium", "{{.Name}}-data-pool.vdi", "--port", "0", "--device", "0"],
  ]
}

build {
  sources = ["source.virtualbox-iso.omniosce-r151038"]

  provisioner "shell" {
    scripts = [
        "provisioners/guest-additions",
        "provisioners/pkg"
    ]
  }

  post-processor "vagrant" {
    compression_level = 9
    output            = "./builds/virtualbox/omniosce-r151038.box"
  }
}
