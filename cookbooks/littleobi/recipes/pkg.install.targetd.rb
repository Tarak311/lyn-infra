
dnf_package 'targetd-tools' do
  flush_cache [ :after ]
  package_name   %w(targetcli iscsi-initiator-utils )
  action         :install # defaults to :install if not specified
end
