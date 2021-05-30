dnf_package 'virt-tools' do
    flush_cache [ :after ]
    package_name   %w( qemu-kvm libvirt libvirt-python3 libguestfs-tools virt-install virt-viewer)
    action         :install # defaults to :install if not specified
end 


service 'libvirtd' do
    pattern 'libvirtd'
    action [:enable, :start]
end



yumgroup 'Virtualization Host' do
    action :upgrade
end
