
dnf_package 'selinux-tools' do
    flush_cache [ :after ]
    package_name   %w(policycoreutils  selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans )
    action         :install # defaults to :install if not specified
end 

#policycoreutils-python