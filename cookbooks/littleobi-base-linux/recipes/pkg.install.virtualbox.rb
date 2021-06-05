yum_repository 'virtualbox' do
  baseurl 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch'
  description     'This is repo for virtualbox'
  enabled         true
  gpgcheck        true
  gpgkey          'https://www.virtualbox.org/download/oracle_vbox.asc'
end

dnf_package 'VirtualBox' do
  action :install
  flush_cache    [ :after ]
  package_name   %w(VirtualBox-6.0)
  action         :install # defaults to :install if not specified
end

remote_file '/tmp/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack' do
  source 'https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'Install VirtualBox Extension Pack' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    echo y | vboxmanage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
    EOH
end
