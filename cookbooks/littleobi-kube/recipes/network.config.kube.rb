kernel_module 'br_netfilter' do
  action :install
end
sysctl 'net.bridge.bridge-nf-call-ip6tables' do
  value '1'
end

sysctl 'net.ipv4.ip_forward' do
  value '1'
end

sysctl 'net.bridge.bridge-nf-call-iptables' do
  value '1'
end

template '/etc/sysctl.d/k8s.conf' do
  source 'k8s.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end 
    

# writefun for sysctl --system