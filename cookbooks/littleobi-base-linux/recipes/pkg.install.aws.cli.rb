dnf_package 'pip3' do
    flush_cache [ :after ]
    package_name   %w( python3-pip)
    action         :install # defaults to :install if not specified
end


pip3 'awscli' do
    action :upgrade
end

pip3 'boto3' do
    action :upgrade
end
