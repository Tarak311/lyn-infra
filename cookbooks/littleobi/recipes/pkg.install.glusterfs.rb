
if  node['littleobi']['glusterfs']['enabled']
    case node['platform']
    when 'centos'

       
        

        dnf_package 'centos-release-gluster' do
            
            package_name   %w(centos-release-gluster)
            action         :install # defaults to :install if not specified
            ignore_failure true
        end

        ruby 'Correcting Repo' do
            interpreter 'bash'
            code <<-EOH
            sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
            EOH
        end
        dnf_package 'glusterfs-server' do
            flush_cache [ :after ]
            package_name   %w(glusterfs-server)
            action         :install # defaults to :install if not specified
        end

    when 'fedora'
        package 'glusterfs-server' do
            flush_cache [ :after ]
            package_name   %w(glusterfs-server)
            action         :install # defaults to :install if not specified
        end
        
    when 'ubuntu'
        package 'software-properties-common'

        apt_update 'after_update_glusterfs' do
            ignore_failure true
            action :update
            subscribes :add, 'resource[glusterfs-repo]', :immediately
        end
        
        apt_repository 'glusterfs-repo' do
            uri          'ppa:gluster/glusterfs-7'
            action :add
        end

        package 'glusterfs-server' do
            package_name   %w(glusterfs-server)
            action         :install # defaults to :install if not specified
        end
    end 

    
    service 'glusterd' do
        pattern 'glusterd'
        action [:enable, :start]
    end
end