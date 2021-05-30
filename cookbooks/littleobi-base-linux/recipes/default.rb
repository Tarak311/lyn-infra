#
# Cookbook:: littleobi-base-linux
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'linux_patching::default'
include_recipe 'littleobi-base-linux::init'
include_recipe 'littleobi-base-linux::base'
include_recipe 'littleobi-base-linux::targetd'
include_recipe 'littleobi-base-linux::selinux.security'
include_recipe 'littleobi-base-linux::firewalld'
include_recipe 'littleobi-base-linux::virtualization'
include_recipe 'littleobi-base-linux::virtualbox.virtualization'
include_recipe 'littleobi-base-linux::network.config.rb'