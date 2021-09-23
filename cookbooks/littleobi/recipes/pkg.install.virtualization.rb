
if  node['littleobi']['virt-tools']['enabled']
  
  
  case node['platform']
  when 'fedora'
    dnf_package 'virt-tools' do
      flush_cache [ :after ]
      package_name   %w( qemu-kvm libvirt libvirt-python3 libguestfs-tools virt-install virt-viewer libvirt-client)
      action         :install # defaults to :install if not specified
    end
    
    dnf_package 'virt-tools-fedora' do
      flush_cache [ :after ]
      package_name   %w( kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras )
      action         :install # defaults to :install if not specified
    end
    service 'libvirtd' do
      pattern 'libvirtd'
      action [:enable, :start]
    end
  when 'centos'
    yumgroup 'Virtualization Host' do
      action :install
    end
  
    yumgroup 'Virtualization Client' do
      action :install
    end
  
    yumgroup 'Virtualization Platform' do
      action :install
    end
  
    yumgroup 'Virtualization Tools' do
      action :install
    end
  
    yumgroup 'Virtualization Hypervisor' do
      action :install
    end
  when 'ubuntu'
    package 'virt-tools' do
      package_name %w(qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils)
      action :install
    end

    group 'libvirt' do
      append true
      members %w(administrator)
      action :create
    end
    
    group 'kvm' do
      append true
      members %w(administrator)
      action :create
    end
  end
end