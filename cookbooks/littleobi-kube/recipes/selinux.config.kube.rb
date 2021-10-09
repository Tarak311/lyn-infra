if node['platform'] == 'ubuntu'
  directory '/etc/sysconfig/' do
    owner 'root'
    group 'root'
    mode '0640'
    action :create
  end
end

template '/etc/sysconfig/selinux' do
  source 'selinux.erb'
  owner 'root'
  group 'root'
  mode  '0640'
end 

    