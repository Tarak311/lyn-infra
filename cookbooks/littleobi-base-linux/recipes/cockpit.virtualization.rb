dnf_package 'cookpit' do
    flush_cache [ :after ]
    package_name   %w(cockpit cockpit-machines)
    action         :install # defaults to :install if not specified
end 

service 'cockpit' do
    pattern 'cockpit'
    action [:enable, :start]
end