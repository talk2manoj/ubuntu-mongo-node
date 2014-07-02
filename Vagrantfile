projectroot = '/home/vagrant'


Vagrant.configure("2") do |config|

  config.berkshelf.enabled = true

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 2
    end

  #config.ssh.insert_key = true
  #config.ssh.forward_agent = true
  config.ssh.password = "vagrant"

  config.vm.network "private_network", ip: "33.33.33.11"
  #config.vm.hostname = "xxx"

  config.vm.synced_folder ".", "#{projectroot}"

  $provision_script= <<SCRIPT
  if [[ $(which chef-solo) != '/usr/bin/chef-solo' ]]; then
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
    echo 'export PATH="/opt/chef/embedded/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile
  fi
SCRIPT
  config.vm.provision :shell, :inline => $provision_script

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :hostname => "xxx",
      :user => "xxx",
      :mongodb => {
        "package-version" => "2.6.3"
      }
    }
    chef.run_list = [
      "recipe[ubuntu-mongo-node::default]"
    ]

  end

end
