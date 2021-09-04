# v1.0.0 
# To enable this package please set the following variable as per needs.
#  default['littleobi']['hashicrop']['enabled']
#  default['littleobi']['terraform']['install']
#  default['littleobi']['packer']['install']
#  default['littleobi']['vagrant']['install']




if  default['littleobi']['hashicrop']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
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
    end

    include_recipe 'littleobi::reinit.base'

    if  default['littleobi']['terraform']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        dnf_package  'terraform' do
            flush_cache [ :after ]
            package_name   %w(terraform) 
            action         :install # defaults to :install if not specified
        end
    end

    if  default['littleobi']['packer']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        dnf_package  'packer' do
            flush_cache [ :after ]
            package_name   %w(packer) 
            action         :install # defaults to :install if not specified
        end
    end

    if  default['littleobi']['vagrant']['install'] # This variable is set in attributes file or during node bootstrap, please override these variables.

        dnf_package  'vagrant' do
            flush_cache [ :after ]
            package_name   %w(vagrant) 
            action         :install # defaults to :install if not specified
        end
    end
end