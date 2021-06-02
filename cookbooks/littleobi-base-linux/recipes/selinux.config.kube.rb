template '/etc/sysconfig/selinux' do
  source 'selinux.erb'
  owner 'root'
  group 'root'
  mode  '0644'
end 
  