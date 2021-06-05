

bash 'Clean rpm/yum/dnf chache' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    dnf clean all
    yum update -y --allowerasing
    EOH
end




