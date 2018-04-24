VAGRANTFILE_API_VERSION = "2"
BOX_NAME = 'bento/ubuntu-16.04'
HOSTNAME = 'ros'

# BOX_IP = '192.168.0.42'
DOMAIN   = 'vagrant.dev'

Vagrant.require_version '>= 1.4.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = BOX_NAME
    config.vm.hostname = HOSTNAME
    config.vm.host_name = HOSTNAME + '.' + DOMAIN

    # config.vm.network :private_network, ip: BOX_IP

    config.vm.synced_folder ".",                 "/vagrant",                disabled: false
    config.vm.synced_folder "./share/catkin_ws", "/home/vagrant/catkin_ws", create: true

    # config.vm.synced_folder "./share", "/share", id: "vagrant-root",
    #     owner: "vagrant",
    #     group: "nobody",
    #     mount_options: ["dmode=777,fmode=755"]


    config.vm.provider "vmware_fusion" do |v|
        v.gui = true
        # Nice list of opts here: https://www.basvanbeek.nl/linux/undocumented-vmware-vmx-parameters/
        # cpu, ram, 3D & vram
        v.vmx["numvcpus"] = "2"
        v.vmx["memsize"] = "2048"
        v.vmx["mks.enable3d"] = "TRUE"
        v.vmx["svga.graphicsMemoryKB"] = "262144"
        v.vmx["svga.guestBackedPrimaryAware"] = "TRUE"

        # v.vmx["mks.minFullscreenWidth"] = "1900"
        # v.vmx["mks.minFullscreenHeight"] = "1200"
        # v.vmx["svga.maxWidth"] = "“1900"
        # v.vmx["svga.maxHeight"] = "1200"
    end

    # Setup Port Forwarding for rosbridge server
    config.vm.network "forwarded_port", guest: 11311, host: 11311, protocol: "tcp"
    config.vm.network "forwarded_port", guest: 11311, host: 11311, protocol: "udp"
    config.vm.network "forwarded_port", guest: 9090,  host: 9090,  protocol: "tcp"
    config.vm.network "forwarded_port", guest: 9090,  host: 9090,  protocol: "udp"

    config.vm.provision 'shell', privileged: false, path: 'provision/_pre-run.sh',        name: '_pre-run.sh'
    config.vm.provision 'shell', privileged: false, path: 'provision/base-packages.sh',   name: 'base-packages.sh'
    config.vm.provision 'shell', privileged: true,  path: 'provision/display-manager.sh', name: 'display-manager.sh'
    config.vm.provision 'shell', privileged: true,  path: 'provision/ros.sh',             name: 'ros.sh'

    config.vm.provision "shell", privileged: false, inline: "sudo rosdep fix-permissions"
    config.vm.provision "shell", privileged: false, inline: "rosdep update"

    # Setup Default Catkin Base Project
    # We need to run this as the vagrant user, so that the workspace gets installed correctly
    config.vm.provision "shell", privileged: false, inline: "su -c /vagrant/provision/ros-catkin-workspace.sh vagrant"

    config.vm.provision :reload

end
