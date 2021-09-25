if  node['littleobi']['awscli']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
    package 'pip3' do
        package_name   %w( python3-pip)
        action         :install # defaults to :install if not specified
    end
    
    
    littleobi_pip3 'boto3'   
    littleobi_pip3 'awscli'
end    

