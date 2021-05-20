#
# Cookbook:: primary_server
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'os-hardening::default'
include_recipe 'chef-client::default'

include_recipe 'linux_patching::default'



dnf_package 'base-tools' do
  flush_cache [ :after ]
  package_name   %w(net-tools python3 NetworkManager-wifi )
  action         :upgrade # defaults to :install if not specified
end

yumgroup 'Development Tools' do
  action :upgrade
end



selinux_state "SELinux Permissive" do
  action :permissive
end