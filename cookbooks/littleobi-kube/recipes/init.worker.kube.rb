case node['platform']
when 'centos'
    bash 'disable swap' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        sudo sed -i '/ swap / s/^/#/' /etc/fstab
        EOH
    end

    directory '/etc/docker/' do
        owner 'root'
        group 'docker'
        
        mode '0755'
    end
  
    dnf_package 'zram-generator-defaults' do 
        action :remove
    end

    service 'swap-create@zram0' do
        pattern 'swap-create@zram0' 
        subscribes  :stop , 'dnf_package[zram-generator-defaults], :immediately'
    end
    

    template '/etc/docker/daemon.json' do
        source 'daemon.json.erb'
        owner 'root'
        group 'docker'
        mode '0755'
        action :create
    end

    service 'docker' do
        action [:enable, :start]
    end
    

    bash 'deamon-reload' do
        code <<-EOH
      d
        EOH
        action :run
    end
    
    service 'docker' do
        action [:enable, :restart]
    end
    

    
    

    
    


  

    

when 'fedora'
    bash 'disable swap' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        sudo sed -i '/ swap / s/^/#/' /etc/fstab
        EOH
    end

    dnf_package 'zram-generator-defaults' do 
        action :remove
    end

    service 'swap-create@zram0' do
        pattern 'swap-create@zram0' 
        subscribes  :stop , 'dnf_package[zram-generator-defaults]', :immediately
    end

    template '/etc/docker/daemon.json' do
        source 'daemon.json.erb'
        owner 'root'
        group 'docker'
        mode '0755'
        action :create
    end

    service 'docker' do
        action [:enable, :start]
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
    
  
    
    

    
    


   

    bash 'generate_token' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        KUBETOKEN=$(kubeadm token create --print-join-command)
        EOH
        only_if { ::File.exist?('/tmp/kubeinit.log') }
    end

end
