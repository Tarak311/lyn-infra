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
        
        mode '0640'
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

    directory '/home/administrator/.kube/' do
        owner 'root'
        group 'kube'
        mode '0750'
        only_if { ::File.exist?('/tmp/kubeinit') }
    end
    
    lyn_infra_secret_key  = Chef::EncryptedDataBagItem.load_secret("/priv/lyn_infra_secret_key.pem")
    administrator_secret = Chef::EncryptedDataBagItem.load("passwords", "administrator",lyn_infra_secret_key)


    remote_file "/home/administrator/.kube/config" do
        source "sftp://administrator:#{administrator_secret['Password']}@192.168.4.3:/home/administrator/.kube/config"
        owner 'root'
        group 'kube'
        mode '0640'
        action :create
        only_if { ::File.exist?('/tmp/kubeinit') }
      end
    
    bash 'kube_init_worker' do
        code <<-EOH
        $(kubeadm token create --print-join-command)
        EOH
        action :run
        only_if { ::File.exist?('/tmp/kubereinit') }
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
        mode '0640'
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
    
    directory '/home/administrator/.kube/' do
        owner 'root'
        group 'kube'
        mode '740'
        only_if { ::File.exist?('/tmp/kubeinit') }
    end
    
    lyn_infra_secret_key  = Chef::EncryptedDataBagItem.load_secret("/priv/lyn_infra_secret_key.pem")
    administrator_secret = Chef::EncryptedDataBagItem.load("passwords", "administrator",lyn_infra_secret_key)


    remote_file "/home/administrator/.kube/config" do
        source "sftp://administrator:#{administrator_secret['Password']}@192.168.4.3/home/administrator/.kube/config"
        owner 'root'
        group 'kube'
        mode '0640'
        action :create  
        only_if { ::File.exist?('/tmp/kubeinit') }
    end
    
    bash 'kube_init_worker' do
        code <<-EOH
        $(kubeadm token create --print-join-command)
        EOH
        action :run
        only_if { ::File.exist?('/tmp/kubereinit') }
    end

end
