if  node['littleobi']['ad-tools']['enabled']
    package 'realmd-pkgs' do
        package_name   %w(realmd sssd oddjob oddjob-mkhomedir adcli samba-common)
        action         :install # defaults to :install if not specified
    end
    
    
    case node['platform']
    when 'centos'
        package 'realmd-pkgs' do
            flush_cache [ :after ]
            package_name   %w(samba-common-tools authselect-compat krb5-workstation)
            action         :install # defaults to :install if not specified
        end
    when 'fedora'
        package 'realmd-pkgs' do
            flush_cache [ :after ]
            package_name   %w(samba-common-tools authselect-compat krb5-workstation)
            action         :install # defaults to :install if not specified
        end
    when 'ubuntu'
        package 'realmd-pkgs' do
            package_name   %w(krb5-user)
            action         :install # defaults to :install if not specified
        end
    end
end    

        


