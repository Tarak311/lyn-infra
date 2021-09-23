

if  node['littleobi']['cockpit']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
  case node['platform']
  when 'centos'
    dnf_package 'cookpit' do
      flush_cache [ :after ]
      package_name   %w(cockpit cockpit-machines)
      action         :install # defaults to :install if not specified
    end
  
    service 'cockpit' do
    pattern 'cockpit'
      action [:enable, :start]
    end
  
    firewalld_service 'cockpit' do
      action :add
      zone   'public'
    end
  when 'fedora'
    dnf_package 'cookpit' do
      flush_cache [ :after ]
      package_name   %w(cockpit cockpit-machines)
      action         :install # defaults to :install if not specified
    end
  
    service 'cockpit' do
      pattern 'cockpit'
      action [:enable, :start]
    end
  
    firewalld_service 'cockpit' do
      action :add
      zone   'public'
    end
  when 'ubuntu'
    
    package 'cockpit' do 
      package_name   %w(cockpit)
      action :install
    end

    firewalld_service 'cockpit' do
      action :add
      zone   'public'
    end
  end
end
  
