if node['littleobi']['heketi']['enabled']
    if node['littleobi']['role']['primary']

        directory '/priv/' do
            owner 'root'
            group 'root'
            mode '0640'
            action :create
        end

        directory '/priv/heketi' do
            owner 'root'
            group 'heketi'
            mode '0640'
            action :create
        end

        bash 'genertating key-pair' do
            code <<-EOH
            ssh-keygen -f /priv/heketi/heketi.key -t ecdsa -b 521 -N ''
            EOH
            action :run
            not_if { ::File.exist?('/priv/heketi/heketi.key') }
        end


        directory '/data' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end


        directory '/data/share/' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end

        directory '/data/share/pubkeys' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end

        remote_file '/data/share/pubkeys/heketi.key.pub' do
            source 'file:///priv/heketi/heketi.key.pub'
            owner 1000
            group 1000
            mode '0640'
            action :create
        end

        directory '/data/priv/' do
            owner "root"
            group "root"
            mode '0640'
            action :create
        end

        directory '/data/priv/heketi/' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end


        directory '/data/priv/heketi/config' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end


        directory '/data/priv/heketi/db' do
            owner 1000
            group 1000
            mode '0640'
            action :create
        end

        template '/data/priv/heketi/config/heketi.json' do
            source 'heketi.json.erb'
            owner 1000
            group 1000
            mode '0640'
            action :create
        end


        remote_file '/data/priv/heketi/config/heketi.key' do
            source 'file:///priv/heketi/heketi.key'
            owner 1000
            group 1000
            mode '0600'
            action :create
        end

        
        #heketi_secret = Chef::EncryptedDataBagItem.load("password", "heketi",IO.read("/priv/lyn_infra_secret_key.pem"))

        template '/data/priv/heketi/config/heketi.json' do
            source 'heketi.json.erb'
            owner 1000
            group 1000
            mode '0660'
            #variables  :admin_password => heketi_secret['admin'], :user_password => heketi_secret['user']                    
            variables  :admin_password => "qwerty", :user_password => "qwerty"                    
            action :create
        end
        #lyn_infra_secret_key  = Chef::EncryptedDataBagItem.load_secret(IO.read("/priv/lyn_infra_secret_key.pem" )
        #heketi_secret = Chef::EncryptedDataBagItem.load("password", "heketi",IO.read("/priv/lyn_infra_secret_key.pem"))

       
        

    end

    #lyn_infra_secret_key  = Chef::EncryptedDataBagItem.load_secret("/priv/lyn_infra_secret_key.pem")
    #storageadm_secret = Chef::EncryptedDataBagItem.load("passwords", "storageadm",IO.read("/priv/lyn_infra_secret_key.pem"))

   

    group 'disk' do
        append true
        members %w(storageadm)
        action :create
    end

    group 'gluster' do
        append true
        members %w(storageadm)
        action :create
    end

    group 'libstoragemgmt' do
        append true
        members %w(storageadm)
        action :create
    end

    group 'plugdev' do
        append true
        members %w(storageadm)
        action :create
    end

    directory '/home/storageadm' do
        owner 'storageadm'
        group 'storageadm'
        mode '0750'
        action :create
    end

    directory '/home/storageadm/.ssh' do
        owner 'storageadm'
        group 'storageadm'
        mode '0750'
        action :create
    end
    
    

end



  