#
# Cookbook:: primary_server
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'littleobi-base-linux::default'




selinux_state 'SELinux Permissive' do
  action :permissive
end
