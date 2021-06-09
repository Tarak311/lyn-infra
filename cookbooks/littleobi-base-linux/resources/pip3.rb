property :package, String, default: ''

action :update do 
  bash 'install pip3 pkg' do
      user 'root'
      cwd '/tmp'
      code <<-EOH
        pip3 install #{new_resource.package}
      EOH
  end
end
     
action :remove do 
  bash 'remove pip3 pkg' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
        pip3 install #{new_resource.package}
    EOH
  end
end
