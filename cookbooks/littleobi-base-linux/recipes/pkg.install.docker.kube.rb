# this will install docker
yum_repository 'docker-ce' do
  baseurl         'https://download.docker.com/linux/centos/$releasever/$basearch/stable'
  description     'Repo for Docker-CR'
  enabled         true
  gpgcheck        true
  gpgkey          'https://download.docker.com/linux/centos/gpg'
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
  