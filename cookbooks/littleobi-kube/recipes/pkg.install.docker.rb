# this will install docker
case node['platform']
when 'centos'
  yum_repository 'docker-ce' do
    baseurl         'https://download.docker.com/linux/centos/$releasever/$basearch/stable'
    description     'Repo for Docker-CR'
    enabled         true
    gpgcheck        true
    gpgkey          'https://download.docker.com/linux/centos/gpg'
  end

  bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      dnf remove podman -y
      dnf autoremove -y
      dnf clean all -y
      yum update -y --allowerasing
      EOH
  end
  
  
  
  dnf_package 'docker-ce' do
    flush_cache [ :after ]
    package_name   %w(docker-ce)
    action         :install # defaults to :install if not specified
  end

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
  
  bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      dnf clean all
      yum update -y --allowerasing
      EOH
  end
  
  
  
  dnf_package 'docker-ce' do
    flush_cache [ :after ]
    package_name   %w(docker-ce docker-ce-cli containerd.io)
    action         :install # defaults to :install if not specified
  end

  service 'docker' do
    pattern 'docker'
    action [:enable, :start]
  end
end