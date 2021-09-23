if  node['littleobi']['iscsi-tools']['enabled']
  case node['platform']
  when 'centos'
    dnf_package 'targetd-tools' do
      flush_cache [ :after ]
      package_name   %w(targetcli iscsi-initiator-utils )
      action         :install # defaults to :install if not specified
    end
    service 'target' do
      action [:enable, :start]
    end
  when 'ubuntu'
    package 'iscsi-tools' do
      package_name %w(open-iscsi targetcli-fb)
      action :install
    end
    
    
  when 'fedora'
    dnf_package 'targetd-tools' do
      flush_cache [ :after ]
      package_name   %w(targetcli iscsi-initiator-utils )
      action         :install # defaults to :install if not specified
    end
    service 'target' do
      action [:enable, :start]
    end
  end
end

  


 