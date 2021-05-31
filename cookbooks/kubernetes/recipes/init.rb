bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    dnf clean all
    EOH
end

sysctl 'vm.swappiness' do
    value 0
end

bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    swapoff -a
    EOH
end


