
bash 'Clean rpm/yum/dnf chache' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    dnf clean all
    EOH
end


dnf_package 'plugin tools' do
  flush_cache [ :after ]
  package_name   %w(dnf-plugins-core )
  action         :install # defaults to :install if not specified
end

