

include_recipe 'littleobi-base-linux::pkg.install.vscode'
include_recipe 'littleobi-base-linux::pkg.install.hashicrop'

group 'kube' do
    append                true 
    members               "tarak311"
    action                :create # defaults to :create if not specified
end

group 'docker' do
    append                true 
    members               "tarak311"
    action                :create 
end

directory '/home/tarak311/.kube/' do
    owner 'tarak311'
    group 'kube'
    mode '0755'
    subscribes  :create , 'bash[Init as master]', :immediately
end


remote_file "Copy kube config file" do 
    path "/home/tarak311/.kube/config" 
    source "file:////root/.kube/config"
    owner 'tarak311'
    group 'kube'
    mode 0755
    subscribes  :create , 'directory [/root/.kube/]', :immediately
end