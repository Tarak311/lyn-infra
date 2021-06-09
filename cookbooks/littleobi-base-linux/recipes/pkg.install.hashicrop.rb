dnf_package  'yum-utils' do
    flush_cache [ :after ]
    package_name   %w( python3-pip)
    action         :install # defaults to :install if not specified
end

yum_repository 'hashicorp' do
    baseurl         'https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable'
    description     'Repo for hashicorp'
    enabled         true
    gpgcheck        true
    gpgkey          'https://rpm.releases.hashicorp.com/gpg'
end


include_recipe 'littleobi-base-linux::reinit.base'


dnf_package  'terraform' do
    flush_cache [ :after ]
    package_name   %w(terraform)
    action         :install # defaults to :install if not specified
end