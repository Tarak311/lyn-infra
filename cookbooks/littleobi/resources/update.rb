property :skip_broken, String, default: '--skipbroken'

action :update do 
  bash 'Clean rpm/yum/dnf chache' do
      user 'root'
      cwd '/tmp'
      code <<-EOH
        dnf clean all
        yum update -y
      EOH
  end
end
     
action :clean do 
  bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
        dnf clean all
    EOH
  end
end
