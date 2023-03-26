# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure('2') do |config|
    config.vm.define 'omniosce-r151038', primary: true do |vm1|
        # The most common configuration options are documented and commented below.
        # For a complete reference, please see the online documentation at
        # https://docs.vagrantup.com.

        config.vagrant.plugins = %w[vagrant-vbguest vagrant-reload]
        if Vagrant.has_plugin? 'vagrant-vbguest'
            config.vbguest.no_install = true
            config.vbguest.auto_update = false
            config.vbguest.no_remote   = true
        end

        # Every Vagrant development environment requires a box. You can search for
        # boxes at https://vagrantcloud.com/search.
        config.vm.box = 'omniosce-r151038'
        config.vm.box_url = 'builds/virtualbox/omniosce-r151038.box'
        # Use a pre-built image from Vagrant Hub
        #config.vm.box = 'storvix/omniosce-r151038'
        config.ssh.username = 'admin'
        config.ssh.password = 'admin'
        config.ssh.insert_key = false
        config.ssh.forward_agent = true

        # Disable automatic box update checking. If you disable this, then
        # boxes will only be checked for updates when the user runs
        # `vagrant box outdated`. This is not recommended.
        # config.vm.box_check_update = false

        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine. In the example below,
        # accessing "localhost:8080" will access port 80 on the guest machine.
        # NOTE: This will enable public access to the opened port
        vm1.vm.network 'forwarded_port', guest: 22, host: 22038, id: 'ssh'
        vm1.vm.network 'forwarded_port', guest: 80, host: 8038, id: 'web'

        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine and only allow access
        # via 127.0.0.1 to disable public access
        # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

        # Create a private network, which allows host-only access to the machine
        # using a specific IP.
        vm1.vm.network 'private_network', ip: '192.168.56.30', virtualbox__intnet: true, auto_config: false
        
        # Create a public network, which generally matched to bridged network.
        # Bridged networks make the machine appear as another physical device on
        # your network.
        # config.vm.network "public_network"

        # Share an additional folder to the guest VM. The first argument is
        # the path on the host to the actual folder. The second argument is
        # the path on the guest to mount the folder. And the optional third
        # argument is a set of non-required options.
        vm1.vm.synced_folder '.', '/home/admin/vagrant', disabled: true

        # Provider-specific configuration so you can fine-tune various
        # backing providers for Vagrant. These expose provider-specific options.
        # Example for VirtualBox:
        #
        vm1.vm.provider 'virtualbox' do |vb|
            vb.check_guest_additions = false
            vb.name = 'omniosce-r151038'
            # Display the VirtualBox GUI when booting the machine
            vb.gui = false
            # Customize the amount of memory on the VM:
            vb.memory = '4096'
            vb.cpus = '2'
        end
        
        # View the documentation for the provider you are using for more
        # information on available options.

        # Enable provisioning with a shell script. Additional provisioners such as
        # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
        # documentation for more information about their specific syntax and use.
        # config.vm.provision :shell, :path => "provisioners/shellprovision.sh"
        # config.vm.provision "shell", inline: <<-SHELL
        #   pfexec pkg install git
        #   git clone git@github.com:STORViX/illumos-gate.git
        # SHELL
        # config.vm.provision :shell, :path => "provisioners/shellprovisioner.sh"
        
        vm1.vm.provision 'file', source: './provisioners', destination: '/home/admin/provisioners'
        #vm1.vm.provision 'shell', path: 'provisioners/shellprovision.sh', args: '0'
        vm1.vm.provision 'shell', path: './provisioners/shellprovisioner'
        vm1.vm.provision 'shell', path: './provisioners/pkg'
        vm1.vm.provision :reload
        vm1.vm.provision 'shell', path: './provisioners/zfs'
        vm1.vm.provision 'shell', path: './provisioners/lipkgzone'
        vm1.vm.provision 'shell', path: './provisioners/lxzone'
        vm1.vm.provision 'shell', path: './provisioners/apache'
        vm1.vm.provision 'shell', path: './provisioners/ips', args: 'edge'
        vm1.vm.post_up_message = <<-MESSAGE
          Now you can enable the shared folder.
          Be sure to have the ssh agent running and your key loaded.
          Run git clone git@bitbucket.org:storvixdevelopment/aire-build.git aire-build
          Run aire-build/setup /build
          - edge: http://127.0.0.1:8038/aire/r/edge/en/index.shtml
        MESSAGE
    end
end
