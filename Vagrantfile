# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "slimauthbase"

  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Mariadb/mysql port
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  # config.vm.network :forwarded_port, guest: 22, host: 2222

  config.ssh.forward_agent = true

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "mycookbooks"]
    #chef.roles_path = "../my-recipes/roles"
    #chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_recipe "mariadb::server"
    chef.add_recipe "slimauth"
    #chef.add_role "web"
      # You may also specify custom JSON attributes:
    chef.json = {
        "mysql" => {
            "server_debian_password" => "vagrant",
            "server_root_password" => "proot",
            "server_repl_password" => "vagrant"
            
        }
    }
  end

end
