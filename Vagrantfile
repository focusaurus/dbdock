# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # common settings shared by all vagrant boxes for this project
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "dbdock"
  config.vm.network :private_network, ip: "10.9.8.50"
  config.vm.provision "shell", path: "./provision.sh"
  config.vm.synced_folder "./", "/vagrant", disabled: true
  config.ssh.forward_agent = true
end
