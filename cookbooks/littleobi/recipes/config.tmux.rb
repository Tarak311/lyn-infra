

template '/root/.tmux.conf' do
    source '.tmux.conf.erb'
    owner  'root'
    group  'root'
    mode   '0640'
  end 

directory '/home/administrator' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

  template '/home/administrator/.tmux.conf' do
    source '.tmux.conf.erb'
    owner  'administrator'
    group  'administrator'
    mode   '0640'
  end 
