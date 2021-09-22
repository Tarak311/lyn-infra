

def install_rhel_virtualbox()
  yumgroup 'Development Tools' do
    action :upgrade
  end
  yum_repository 'virtualbox' do
    baseurl 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch'
    description     'This is repo for virtualbox'
    enabled         true
    gpgcheck        true
    gpgkey          'https://www.virtualbox.org/download/oracle_vbox.asc'
  end
  package 'epel-release'
  include_recipe 'littleobi::reinit.base'
  dnf_package 'virtualization-tools' do
    action :install
    flush_cache    [ :after ]
    package_name   %w( binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms)
    action         :install # defaults to :install if not specified
  end
  dnf_package 'VirtualBox-6.1' do
    flush_cache [:after]
    action :install
  end
  
  

  remote_file '/tmp/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack' do
    source 'https://download.virtualbox.org/virtualbox/6.1.22/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  bash 'Install VirtualBox Extension Pack' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      echo y | vboxmanage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack
      EOH
  end
end

if  node['littleobi']['Virtualbox']['enabled']
  case node['platform']
  when 'centos'
  install_rhel_virtualbox()

  when 'fedora'
    yumgroup 'Development Tools' do
      action :upgrade
    end
    dnf_package 'virt-tools' do
      flush_cache [ :after ]
      package_name   %w(kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras)
      action         :install # defaults to :install if not specified
    end
    yum_repository 'virtualbox' do
      baseurl 'http://download.virtualbox.org/virtualbox/rpm/fedora/34/\$basearch'
      description     'This is repo for virtualbox'
      enabled         true
      gpgcheck        true
      gpgkey          'https://www.virtualbox.org/download/oracle_vbox.asc'
    end
    dnf_package 'VirtualBox' do
      action :install
      flush_cache    [ :after ]
      package_name   %w(VirtualBox-6.1)
      action         :install # defaults to :install if not specified
    end
    remote_file '/tmp/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack' do
      source 'https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    remote_file '/tmp/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack' do
      source 'https://download.virtualbox.org/virtualbox/6.1.22/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    bash 'Install VirtualBox Extension Pack' do
      user 'root'
      cwd '/tmp'
      code <<-EOH
        echo y | vboxmanage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack
        EOH
    end
  when 'ubuntu'
    package 'virtualbox'
    
  end
  group 'vboxusers' do
    members %w(administrator)
    action :create
  end


end
