ruby 'Correcting Repo' do
    interpreter 'bash'
    ignore_failure true
    code <<-EOH
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    
    EOH
end

user 'administrator' do
    comment 'comment'
    home '/home/administrator'
     #password "#{stoageadm_secret['Password']}"
    password 'qwerty'
    action :create
end

user 'storageadm' do
    comment 'StorageAdm'
    home '/home/storageadm'
    password "qwerty"
    #password "#{stoageadm_secret['Password']}"
    action :create
end