#
# Cookbook:: primary_server
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'os-hardening::default'
include_recipe 'chef-client::default'


dnf_package 'base-tools' do
    flush_cache [ :after ]
    package_name      %w(net-tools python3 NetworkManager-wifi podman)
    action            :upgrade # defaults to :install if not specified
  end
