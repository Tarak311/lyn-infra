yum_repository 'vscode' do
    baseurl         'https://packages.microsoft.com/yumrepos/vscode'
    description     'Repo for Docker-CR'
    enabled         true
    gpgcheck        true
    gpgkey          'https://packages.microsoft.com/keys/microsoft.asc'
end

include_recipe 'littleobi-base-linux::reinit.base'

dnf_package 'vscode' do
    flush_cache [ :after ]
    package_name   %w(code)
    action         :install # defaults to :install if not specified
end

