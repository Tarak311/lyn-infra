directory '/etc/docker/' do
    owner 'root'
    group 'docker'
    mode '0640'
end



template '/etc/docker/daemon.json' do
    source 'daemon.json.erb'
    owner 'root'
    group 'docker'
    mode '0640'
    action :create
end



service 'docker' do
    action [:enable, :restart]
end


bash 'deamon-reload' do
    code <<-EOH
    systemctl daemon-reload  
    EOH
    action :run
end

service 'docker' do
    action [:enable, :restart]
end

