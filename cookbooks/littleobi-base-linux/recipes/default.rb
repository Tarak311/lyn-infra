#
# Cookbook:: littleobi-base-linux
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'yum-centos::default'
include_recipe 'linux_patching::default'


include_recipe 'yum::default'
include_recipe 'littleobi-base-linux::init'
include_recipe 'littleobi-base-linux::base'
include_recipe 'littleobi-base-linux::pkg.install.targetd'
include_recipe 'littleobi-base-linux::selinux.security'
include_recipe 'littleobi-base-linux::firewalld'
include_recipe 'littleobi-base-linux::virtualization'
include_recipe 'littleobi-base-linux::virtualbox.virtualization'
include_recipe 'littleobi-base-linux::default.kube'
include_recipe 'littleobi-base-linux::network.config'
include_recipe 'littleobi-base-linux::pkg.install.gns3'

include_recipe 'littleobi-base-linux::pkg.install.glusterfs'

include_recipe 'littleobi-base-linux::pkg.install.realmd'

include_recipe 'littleobi-base-linux::pkg.install.haproxy'
