
dnf_package 'gns3-tools' do
    flush_cache [ :after ]
    package_name   %w(dnf-plugins-core)
    action         :install # defaults to :install if not specified
end
