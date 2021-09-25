firewalld_service 'iscsi-target' do
    action :add
    zone   'public'
end


sysctl 'net.ipv4.conf.all.rp_filter' do
    value '0'
end


sysctl 'net.ipv4.conf.all.arp_ignore' do
    value '1'
end


sysctl 'net.ipv4.conf.arp_announce' do
    value '2'
end

bash 'reseting systemctl ' do
    user 'root'
    cwd '/tmp/'
    code <<-EOH
    sysctl --system
    EOH
end