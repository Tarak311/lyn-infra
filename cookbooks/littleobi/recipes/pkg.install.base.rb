case node['platform']
when 'centos'

  dnf_package 'plugin tools' do
    flush_cache [ :after ] 
    package_name   %w(dnf-plugins-core )
    action         :install # defaults to :install if not specified
  end

  dnf_package 'network-tools' do
    flush_cache [ :after ]
    package_name   %w(net-tools NetworkManager-wifi wget curl git )
    action         :install # defaults to :install if not specified
  end
  remote_file '/tmp/elrepo-release-8.2-1.el8.elrepo.noarch.rpm' do
    source 'http://mirror.rackspace.com/elrepo/elrepo/el8/x86_64/RPMS/elrepo-release-8.2-1.el8.elrepo.noarch.rpm'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  
  
  package "elrepo-release-8.2-1.el8.elrepo.noarch.rpm" do
    source "/tmp/elrepo-release-8.2-1.el8.elrepo.noarch.rpm"
    action :install
  end

  dnf_package 'automation-install-tools' do
    flush_cache [ :after ]
    package_name   %w(python3 make patch gcc )
    action         :install # defaults to :install if not specified
    end

  dnf_package 'core-tools' do
    flush_cache [ :after ]
    package_name   %w(redhat-lsb-core elrepo-release epel-release kernel-headers kernel-devel lvm2  tmux )
    action         :install # defaults to :install if not specified
  end

  yumgroup 'Development Tools' do
    action :upgrade
  end

  if node['littleobi']['lvm2']['enabled']
    dnf_package 'network-tools' do
      flush_cache [ :after ]
      package_name   %w(lvm2 )
      action         :install # defaults to :install if not specified
    end
  end
  if node['littleobi']['btrfs']['enabled']
  bash 'btrfs-install' do
    code <<-EOH
    dnf --enablerepo=elrepo-testing install elrepo-release
    EOH
    action :run
  end
    
  end
  if node['littleobi']['exfat']['enabled']
  end

  template '/root/.tmux.conf' do
    source '.tmux.conf.erb'
    owner  'root'
    group  'root'
    mode   '0666'
  end 

when 'fedora'
  dnf_package 'plugin tools' do
    flush_cache [ :after ]
    package_name   %w(dnf-plugins-core )
    action         :install # defaults to :install if not specified
  end

  dnf_package 'network-tools' do
    flush_cache [ :after ]
    package_name   %w(net-tools NetworkManager-wifi wget curl git )
    action         :install # defaults to :install if not specified
  end

  dnf_package 'automation-install-tools' do
    flush_cache [ :after ]
    package_name   %w(python3 make patch gcc)
    action         :install # defaults to :install if not specified
    end

  dnf_package 'core-tools' do
    flush_cache [ :after ]
    package_name   %w(redhat-lsb-core  kernel-headers kernel-devel lvm2 htop tmux )
    action         :install # defaults to :install if not specified
  end
  
  
  yumgroup 'Development Tools' do
    action :upgrade
  end
  
  
  if node['littleobi']['exfat']['enabled']
  end
  template '/root/.tmux.conf' do
    source '.tmux.conf.erb'
    owner  'root'
    group  'root'
    mode   '0666'
  end 

end