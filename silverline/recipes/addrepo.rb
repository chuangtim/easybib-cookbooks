include_recipe "apt::ppa"

execute "apt_get_update" do
  command "apt-get update"
end

execute "librato_add_key" do
  command "curl http://apt.librato.com/packages.librato.key | apt-key add -"
  action :nothing
  notifies :run, resources(:execute => "apt_get_update"), :immediately
end

template "/etc/apt/sources.list.d/silverline.list" do
  source "silverline.list.erb"
  notifies :run, resources(:execute => "librato_add_key"), :immediately
end
