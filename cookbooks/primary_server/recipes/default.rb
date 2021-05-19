#
# Cookbook:: primary_server
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'os-hardening::default'
include_recipe 'chef-client::default'

node['linux_patching']['patch'] = {
  'enable' => true,
  'hour' => 3,
  'minute' => 0,
  'monthly' => nil,
  'platforms' => 'all',
  'reboot' => true,
  'splay' => 0,
  'weekly' => 'sunday',
}

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