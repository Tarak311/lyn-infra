#centos-release-gluster
dnf_package 'centos-release-gluster' do
    flush_cache [ :after ]
    package_name   %w(centos-release-gluster)
    action         :install # defaults to :install if not specified
end

dnf_package 'glusterfs-server' do
    flush_cache [ :after ]
    package_name   %w(glusterfs-server)
    action         :install # defaults to :install if not specified
end

service 'glusterd' do
    pattern 'glusterd'
    action [:enable, :start]
end