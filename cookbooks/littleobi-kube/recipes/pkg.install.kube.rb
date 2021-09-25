def install_kubeadm_rehl()
  yum_repository 'kubeadm' do
    baseurl         'https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64'
    description     'Repo for Kubelet'
    enabled         true
    gpgcheck        true
    gpgkey         %w(https://packages.cloud.google.com/yum/doc/yum-key.gpg  https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg)
  end

  dnf_package 'kubeadm' do
      flush_cache [ :after ]
      package_name   %w( kubelet kubeadm kubectl)
      action         :install # defaults to :install if not specified
  end

  service 'kubelet' do
    pattern 'kubelet' 
    action [:enable, :start]
  end
  
end
if  node['littleobi']['kubeadm']['enabled']
  case node['platform']
  when 'centos'
    install_kubeadm_rehl()
  when 'fedora'
    install_kubeadm_rehl()
  when 'ubuntu'
    package 'kube_req' do
      package_name %w(apt-transport-https ca-certificates curl)
      action :install
    end
    apt_repository 'kube-repo' do
      uri          'https://apt.kubernetes.io/ '
      distribution "#{node['platform']}-#{node['lsb']['codename']}"
      components ["main"]
      key  "https://packages.cloud.google.com/apt/doc/apt-key.gpg"
      action :add
    end
    package 'kube_req' do
      package_name %w(kubelet kubeadm kubectl)
      action :install
    end
    bash 'hold_kube_version' do
      code <<-EOH
      apt-mark hold kubelet kubeadm kubectl
      EOH
      action :run
    end
  end
end