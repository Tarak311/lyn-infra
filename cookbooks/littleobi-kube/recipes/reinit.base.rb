case node['platform']

when 'centos'
  ruby 'Clean rpm/yum/dnf chache' do
    interpreter 'bash' 
    code <<-EOH
      dnf clean all
      yum update -y --allowerasing 
    EOH
  end

when 'ubuntu'
  bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      apt update
      EOH
  end
when 'fedora'
  bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      dnf clean all
      yum update -y --allowerasing
      EOH
  end
end

