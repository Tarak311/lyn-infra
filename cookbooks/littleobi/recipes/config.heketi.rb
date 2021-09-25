if node['littleobi']['heketi']['enabled']

    directory '/home/administrator/priv/heketi' do
        owner 'root'
        group 'root'
        mode '0755'
        action :create
    end


    bash 'genertating key-pair' do
        code <<-EOH
        ssh-keygen -f /home/administrator/priv/heketi/heketi -t ecdsa -b 521 -N ''
        EOH
        action :run
    end


    directory '/data/share/' do
        owner 1000
        group 1000
        mode '0755'
        action :create
    end

    directory '/data/share/pubkeys' do
        owner 1000
        group 1000
        mode '0755'
        action :create
    end

    remote_file '/data/share/pubkeys/heketi.key.pub' do
        source '/home/administrator/priv/heketi/heketi.key.pub'
        owner 1000
        group 1000
        mode '660'
        action :create
    end

    directory '/data/heketi/' do
        owner 1000
        group 1000
        mode '0755'
        action :create
    end


    directory '/data/heketi/config' do
        owner 1000
        group 1000
        mode '0755'
        action :create
    end


    directory '/data/heketi/db' do
        owner 1000
        group 1000
        mode '0755'
        action :create
    end

    template '/data/heketi/config/heketi.json' do
        source 'heketi.json.erb'
        owner 1000
        group 1000
        mode '0755'
        action :create
    end


    remote_file '/data/heketi/config/heketi.key' do
        source '/home/administrator/priv/heketi/heketi.key'
        owner 1000
        group 1000
        mode '600'
        action :create
    end
end