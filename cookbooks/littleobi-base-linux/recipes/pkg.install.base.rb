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
    package_name   %w(redhat-lsb-core epel-release kernel-headers kernel-devel lvm2  tmux )
    action         :install # defaults to :install if not specified
  end

  yumgroup 'Development Tools' do
    action :upgrade
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
    package_name   %w(redhat-lsb-core  kernel-headers kernel-devel lvm2  tmux )
    action         :install # defaults to :install if not specified
  end

  yumgroup 'Development Tools' do
    action :upgrade
  end
end