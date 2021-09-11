def init_rehl()
    bash 'Clean rpm/yum/dnf chache' do
        user 'root'
        cwd '/tmp'
        code <<-EOH
        dnf clean all
        EOH
    end
end
case node['platform']
when 'centos'
    init_rehl()
when 'fedora'
    init_rehl()
when  'ubuntu'
    bash 'clean' do
        code <<-EOH
        apt update
        apt autoremove
        EOH
        action :run
    end
end 
sysctl 'vm.swappiness' do
    value 0
end

bash 'swap_off_dynamic' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    swapoff -a
    EOH
end


