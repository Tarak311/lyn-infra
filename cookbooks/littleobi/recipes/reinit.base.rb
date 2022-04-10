case node['platform']

when 'centos'
  
  ruby 'Correcting Repo' do
    interpreter 'bash'
    ignore_failure true
    code <<-EOH
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    
    EOH
  end

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

