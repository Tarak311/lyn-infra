# v1.0.0 
# To enable this package please set the following variable as per needs.
#  default['littleobi']['hashicrop']['enabled']
#  default['littleobi']['terraform']['install']
#  default['littleobi']['packer']['install']
#  default['littleobi']['vagrant']['install']




if  node['littleobi']['hashicrop']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
    case node['platform']

    when 'centos'
        dnf_package  'yum-utils' do
            flush_cache [ :after ]
            package_name   %w( python3-pip yum-utils)
            action         :install # defaults to :install if not specified
        end

        yum_repository 'hashicorp' do
            baseurl         'https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable'
            description     'Repo for hashicorp'
            enabled         true
            gpgcheck        true
            gpgkey          'https://rpm.releases.hashicorp.com/gpg'
        end
    
    when 'fedora'
        dnf_package  'dnf-config-manager' do
            flush_cache [ :after ]
            package_name   %w(python3-pip dnf-plugins-core)
            action         :install # defaults to :install if not specified
        end
    
        yum_repository 'hashicorp' do
            baseurl         'https://rpm.releases.hashicorp.com/fedora/hashicorp.repo'
            description     'Repo for hashicorp'
            enabled         true
            gpgcheck        true
            gpgkey          'https://rpm.releases.hashicorp.com/gpg'
        end
        
        include_recipe 'littleobi::reinit.base'

    when 'ubuntu'
        package 'apt-tools' do
            package_name %w(gnupg software-properties-common curl)
            action :install
        end
        apt_update 'after_update_hashicrop' do
            ignore_failure true
            action :update
            subscribes :add, 'resource[hashi-repo]', :immediately
        end
        apt_repository 'hashi-repo' do
            uri          'https://apt.releases.hashicorp.com'
            distribution "#{node['platform']}-#{node['lsb']['codename']}"
            components ["main"]
            key  "https://apt.releases.hashicorp.com/gpg"
            action :add
        end
         
    end

    if  node['littleobi']['terraform']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        package  'terraform' do
            package_name   %w(terraform) 
            action         :install # defaults to :install if not specified
        end
    end

    if  node['littleobi']['packer']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        package  'packer' do
            package_name   %w(packer) 
            action         :install # defaults to :install if not specified
        end
    end

    if  node['littleobi']['vagrant']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        package  'vagrant' do
            package_name   %w(vagrant) 
            action         :install # defaults to :install if not specified
        end
    end
end