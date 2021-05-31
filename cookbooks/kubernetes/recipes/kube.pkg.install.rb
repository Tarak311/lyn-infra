yum_repository 'kubeadm' do
    baseurl         'https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch'
    description     'Repo for Docker-CR'
    enabled         true
    gpgcheck        true
    gpgkey          'https://packages.cloud.google.com/yum/doc/yum-key.gpg'
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
    