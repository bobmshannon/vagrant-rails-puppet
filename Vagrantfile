Vagrant.configure(2) do |config|
  config.vm.box = "nrel/CentOS-6.6-x86_64"
  config.vm.host_name = "vagrant"
  # Forward 8080 on host machine to guest VM
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # Shared Folders
  config.vm.synced_folder '.', '/vagrant'
  config.vm.synced_folder 'puppet', '/puppet'
  # Puppet Provisioner
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "rails.pp"
  end
end
