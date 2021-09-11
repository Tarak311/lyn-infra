#firewall-cmd --add-service=glusterfs --permanent

firewalld_service 'glusterfs' do
    action :add
    zone   'public'
end