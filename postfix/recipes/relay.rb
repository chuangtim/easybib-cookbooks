ips         = ['127.0.0.0/8']
relay_host  = node['postfix']['relay']['host']
etc_path    = '/etc/postfix'
my_hostname = get_hostname(node)

if is_aws
  instance = get_instance
  ips.push(instance['ip'])
  ips.push(instance['private_ip'])
end

# install main.cf
template "#{etc_path}/main.cf" do
  owner  'postfix'
  group  'postfix'
  mode   '0644'
  source 'main.cf.erb'
  variables(
    :etc_path       => etc_path,
    :ips            => ips,
    :my_hostname    => my_hostname,
    :relay_host     => relay_host,
    :my_destination => my_hostname
  )
end

# setup passwd
template "#{etc_path}/sasl/passwd" do
  source 'passwd.erb'
  mode   '0600'
  variables(
    :relay => [node['postfix']['relay']]
  )
  not_if { relay_host.nil? }
end

execute 'postmap' do
  command "postmap #{etc_path}/sasl/passwd"
  not_if { relay_host.nil? }
end

service 'postfix' do
  supports :status => true, :restart => true, :reload => true, :check => true
  action [:enable, :reload]
end
