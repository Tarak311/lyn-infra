
if  node['littleobi']['vscode']['enabled']
    case node['platform']
    when 'centos'
        yum_repository 'vscode' do
            baseurl         'https://packages.microsoft.com/yumrepos/vscode'
            description     'Repo for Vscode'
            enabled         true
            gpgcheck        true
            gpgkey          'https://packages.microsoft.com/keys/microsoft.asc'
        end
        
        include_recipe 'littleobi::reinit.base'
        
        dnf_package 'vscode' do
            flush_cache [ :after ]
            package_name   %w(code)
            action         :install # defaults to :install if not specified
        end
    when 'fedora'
        yum_repository 'vscode' do
            baseurl         'https://packages.microsoft.com/yumrepos/vscode'
            description     'Repo for Vscode'
            enabled         true
            gpgcheck        true
            gpgkey          'https://packages.microsoft.com/keys/microsoft.asc'
        end
        
        include_recipe 'littleobi::reinit.base'
        
        dnf_package 'vscode' do
            flush_cache [ :after ]
            package_name   %w(code)
            action         :install # defaults to :install if not specified
        end
    when 'ubuntu'
        package 'apt-transport-https' do
           action :install
        end
        apt_update 'after_update_vscode' do
            ignore_failure true
            action :update
            subscribes :add, 'resource[vscode-repo]', :immediately
        end
        apt_repository 'vscode-repo' do
            uri          'https://packages.microsoft.com/repos/code '
            distribution "#{node['platform']}-#{node['lsb']['codename']}"
            components ["main"]
            key  "https://packages.microsoft.com/keys/microsoft.asc"
            action :add
        end
        package 'code '
    end
end



