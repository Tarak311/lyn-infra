dnf_package 'pip3' do
    flush_cache [ :after ]
    package_name   %w( python3-pip)
    action         :install # defaults to :install if not specified
end

bash 'install awscli' do
    code <<-EOH
    pip3 install awscli boto3
    EOH
    action :run
end
