template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode '0755'
end 

resolver_config '/etc/resolv.conf' do
    nameservers ['1.1.1.1', '1.0.0.1']
    domain 'elfheim.littleobi.com'
    options(
      'timeout' => 2
    )
end