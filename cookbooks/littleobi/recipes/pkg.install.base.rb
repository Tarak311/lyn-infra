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

  dnf_package 'automation-install-tools' do
    flush_cache [ :after ]
    package_name   %w(python3 make patch gcc ruby)
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
    dnf_package 'btrfs-progs' do
      flush_cache [ :after ]
      action :install
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
    package_name   %w(python3 make patch gcc ruby)
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
  if node['littleobi']['lvm2']['enabled']
  end
  if node['littleobi']['btrfs']['enabled']
  end
  if node['littleobi']['efat']['enabled']
  end
  template '/root/.tmux.conf' do
    source '.tmux.conf.erb'
    owner  'root'
    group  'root'
    mode   '0666'
  end 

end