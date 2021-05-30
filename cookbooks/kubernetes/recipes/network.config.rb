bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
    modprobe br_netfilter
    EOH
end