#realmd sssd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation authselect-compat
dnf_package 'realmd-pkgs' do
    flush_cache [ :after ]
    package_name   %w(realmd sssd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation authselect-compat)
    action         :install # defaults to :install if not specified
end