
dnf_package 'security-tools' do
  flush_cache [ :after ]
  package_name   %w(firewalld)
  action         :install # defaults to :install if not specified
end
