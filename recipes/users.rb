# User, directories, etc -----------------------------------------------------

if node[:user] != "vagrant"

    group node[:user] do
        gid 1337
    end

    user node[:user] do
        username node[:user]
        comment "Application User"
        gid 1337
        uid 9999
        shell "/bin/bash"
        home "/home/#{node[:user]}"
    end

    directory "/home/#{node[:user]}" do
        owner node[:user]
        group node[:user]
        mode 0755
    end

end

directory "/home/#{node[:user]}/.ssh" do
    owner node[:user]
    group node[:user]
    mode 0700
end

template "/home/#{node[:user]}/.ssh/authorized_keys" do
    source "authorized_keys.erb"
    owner node[:user]
    group node[:user]
    mode 0600
end

template "/home/#{node[:user]}/.bashrc" do
    source "bashrc.erb"
    owner node[:user]
    group node[:user]
    mode 0600
end

template "/home/#{node[:user]}/.gitconfig" do
    source "gitconfig.erb"
    owner node[:user]
    group node[:user]
    # mode 0600
end

cookbook_file "/etc/sudoers" do
    source "sudoers"
    mode 0440
end

# Uncomment the following to disable root login
#
# cookbook_file "/etc/ssh/sshd_config" do
#     source "sshd_config"
# end

# execute "restart ssh" do
#     command "service ssh restart"
# end