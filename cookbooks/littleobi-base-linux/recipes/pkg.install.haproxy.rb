dnf_package 'haproxy' do
    flush_cache [ :after ]
    package_name   %w(haproxy)
    action         :install # defaults to :install if not specified
end