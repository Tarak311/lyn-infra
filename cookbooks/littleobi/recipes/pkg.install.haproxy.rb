if  node['littleobi']['haproxy']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
    if node['platform'] == 'ubuntu'
        package 'software-properties-common'
        
        apt_update 'after_update_haproxy' do
            ignore_failure true
            action :update
            subscribes :add, 'resource[haproxy-repo]', :immediately
        end
        
        apt_repository 'haproxy-repo' do
            uri          'ppa:vbernat/haproxy-2.4'
            action :add
        end
    end
    
    package 'haproxy' do
        package_name   %w(haproxy)
        action         :install # defaults to :install if not specified
    end


    if (node['platform'] == 'fedora' || node['platform'] == 'centos')
        service 'haproxy' do
            pattern 'haproxy'
            action [:enable, :start]
        end
    end

end