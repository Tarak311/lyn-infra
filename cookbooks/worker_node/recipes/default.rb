#
# Cookbook:: worker_node
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'littleobi-base-linux::default'


yumgroup 'Development Tools' do
  action :upgrade
end

selinux_state 'SELinux Permissive' do
  action :permissive
end