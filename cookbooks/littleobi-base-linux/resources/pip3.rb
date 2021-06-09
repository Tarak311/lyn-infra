resource_name :pip3
property :package, String
property :name, String

action :update do 
  bash 'install pip3 pkg' do
      user 'root'
      cwd '/tmp'
      code <<-EOH
        pip3 install #{package}
      EOH
  end
end
     
action :remove do 
  bash 'remove pip3 pkg' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
        pip3 install #{package}
    EOH
  end
end
