# this will install docker
if  node['littleobi']['docker']['enabled']
  case node['platform']
  when 'centos'
  
    dnf_package 'docker-ce-tools' do
      flush_cache [ :after ]
      package_name   %w(yum-utils)
      action         :install # defaults to :install if not specified
    end
  
    dnf_package 'podman' do
      flush_cache [ :after ]
      package_name   %w(podman)
      action         :remove # defaults to :install if not specified
    end
  
    yum_repository 'docker-ce' do
      baseurl         'https://download.docker.com/linux/centos/$releasever/$basearch/stable'
      description     'Repo for Docker-CR'
      enabled         true
      gpgcheck        false
      gpgkey          'https://download.docker.com/linux/centos/gpg'
    end
  
   include_recipe 'littleobi-kube::reinit.base'
  
  
    
    dnf_package 'podman' do
      flush_cache [ :after ]
      package_name   %w(podman)
      action         :remove # defaults to :install if not specified
    end

    ruby 'Clean rpm/yum/dnf chache' do
      interpreter 'bash' 
      code <<-EOH
        dnf clean all
        yum update -y --allowerasing 
      EOH
      not_if { ::File.exist?('/tmp/kubeinit.log') }
    end
    
    bash 'docker_inst' do
      code <<-EOH
        yum install -y docker-ce --allowerasing 
      EOH
      action :run
    end
    

    ruby 'Clean rpm/yum/dnf chache' do
      interpreter 'bash' 
      code <<-EOH
        dnf clean all
        yum update -y --allowerasing 
      EOH
      not_if { ::File.exist?('/tmp/kubeinit.log') }
    end

    include_recipe 'littleobi-kube::reinit.base'

    service 'docker' do
      pattern 'docker'
      action [:enable, :start]
    end
   
  when 'fedora'
    yum_repository 'docker-ce' do
      baseurl         'https://download.docker.com/linux/fedora/$releasever/$basearch/stable'
      description     'Repo for Docker-CR'
      enabled         true
      gpgcheck        true
      gpgkey          'https://download.docker.com/linux/fedora/gpg'
    end
    
   include_recipe 'littleobi-kube::reinit.base'
    
    
    
    dnf_package 'docker-ce' do
      flush_cache [ :after ]
      package_name   %w(docker-ce docker-ce-cli containerd.io)
      action         :install # defaults to :install if not specified
    end
     
    service 'docker' do
      pattern 'docker'
      action [:enable, :start]
    end
   
  when 'ubuntu'
    package 'docker-requirment' do
      package_name %w( apt-transport-https  ca-certificates curl gnupg lsb-release )
      action :install
    end
    
    package 'software-properties-common'
          
    apt_update 'after_update_docker' do
        ignore_failure true
        action :update
        subscribes :add, 'resource[docker-repo]', :immediately
    end
    
    
  
    apt_package 'docker' do
      package_name %w(docker docker containerd.io )
      action :install
    end
    
  end  
  
  group 'docker' do
    append true
    members %w(administrator)
    action :create
  end
  
  
end



