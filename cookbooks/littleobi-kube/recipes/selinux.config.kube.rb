if node['platform'] == 'ubuntu'
  directory '/etc/sysconfig/' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

template '/etc/sysconfig/selinux' do
  source 'selinux.erb'
  owner 'root'
  group 'root'
  mode  '0644'
end 

    