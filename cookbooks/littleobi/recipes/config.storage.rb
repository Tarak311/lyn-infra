


directory '/containers' do
        owner 'root'
        group 'administrator'
        mode '0755'
        action :create
end
directory '/containers/docker' do
        owner 'root'
        group 'administrator'
        mode '0755'
        action :create
end 
directory '/containers/docker/images' do
        owner 'root'
        group 'administrator'
        mode '0755'
        action :create
end
directory '/data' do
        owner 'root'
        group 'administrator'
        mode '0755'
        action :create
end

directory '/data/docker ' do
        owner 'root'
        group 'administrator'
        mode '0755'
        action :create
end
 
    



directory '/data/priv' do
        owner 'root'
        group 'root'
        mode '0750'
        action :create
end

directory '/data/share/' do
        owner 'root'
        group 'root'
        mode '0750'
        action :create
end

directory '/data/share/priv' do
        owner 'root'
        group 'root'
        mode '0750'
        action :create
end

directory '/data/priv' do
        owner 'root'
        group 'root'
        mode '0755'
        action :create
end

directory '/data/priv/heketi' do
        owner 'root'
        group 'root'
        mode '0755'
        action :create
end


# Code to create Partions needed

        # This should be fixed script which takes arguments like which types of device is being used and partion dev playing their part

# Code to create LUKS

# Create VGS

# Create LVS


#Create FS

#Create ISCSI in/out

#changeing files fstab/cryptb /crond so that volumes are mounted on boot

#setup sync between files 