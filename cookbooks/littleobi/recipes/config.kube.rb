

include_recipe 'littleobi::pkg.install.vscode'
include_recipe 'littleobi::pkg.install.hashicrop'

group 'kube' do
    append                true 
    members               "administrator"
    action                :create # defaults to :create if not specified
end

group 'docker' do
    append                true 
    members               "administrator"
    action                :create 
end

directory '/home/administrator/.kube/' do
    owner 'administrator'
    group 'kube'
    mode '0755'
    subscribes  :create , 'bash[Init as master]', :immediately
end


remote_file "Copy kube config file" do 
    path "/home/administrator/.kube/config" 
    source "file:////root/.kube/config"
    owner 'administrator'
    group 'kube'
    mode 0755
    subscribes  :create , 'directory [/root/.kube/]', :immediately
end