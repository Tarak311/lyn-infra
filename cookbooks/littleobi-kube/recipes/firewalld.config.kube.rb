firewalld_masquerade 'public' 

firewalld_port '6443/tcp' do
    action :add
    zone   'public'
end


firewalld_port '2379-2380/tcp' do
    action :add
    zone   'public'
end

firewalld_port '10250/tcp' do
    action :add
    zone   'public'
end

firewalld_port '10251/tcp' do
    action :add
    zone   'public'
end

firewalld_port '10252/tcp' do
    action :add
    zone   'public'
end

firewalld_port '10255/tcp' do
    action :add
    zone   'public'
end

service 'firewalld' do
    pattern 'firewalld'
    action [:restart]
end
    