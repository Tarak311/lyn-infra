dnf_package 'virt-tools' do
  flush_cache [ :after ]
  package_name   %w( qemu-kvm libvirt libvirt-python3 libguestfs-tools virt-install virt-viewer libvirt-client)
  action         :install # defaults to :install if not specified
end

service 'libvirtd' do
  pattern 'libvirtd'
  action [:enable, :start]
end

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