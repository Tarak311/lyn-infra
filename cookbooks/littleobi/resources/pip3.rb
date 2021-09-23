# To learn more about Custom Resources, see https://docs.chef.io/custom_resources/
resource_name :pip3
provides :pip3
property :package, String, name_property: true




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
