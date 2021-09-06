if  node['littleobi']['selinux-tools']['enabled']
  if (node['platform'] == 'centos') || (node['platform'] == 'fedora')
    dnf_package 'selinux-tools' do
      flush_cache [ :after ]
      package_name   %w(policycoreutils selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans )
      action         :install # defaults to :install if not specified
    end
  end
  if node['platform'] == 'ubuntu'
    service 'apparmor' do
      action :stop
    end
    package 'apparmor' do
      package_name   %w(apparmor)
      action         :remove # defaults to :install if not specified
    end
    package 'selinux-tools' do
      package_name   %w(policycoreutils selinux-utils selinux-basics )
      action         :install # defaults to :install if not specified
    end
  end
end  
