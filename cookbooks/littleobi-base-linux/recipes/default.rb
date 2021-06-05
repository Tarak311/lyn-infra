#
# Cookbook:: littleobi-base-linux
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'yum-centos::default'
include_recipe 'yum::default'
include_recipe 'littleobi-base-linux::config.network'
include_recipe 'littleobi-base-linux::reinit.base'
include_recipe 'littleobi-base-linux::pkg.install.base'
include_recipe 'littleobi-base-linux::pkg.install.targetd'
include_recipe 'littleobi-base-linux::pkg.install.selinux'
include_recipe 'littleobi-base-linux::reinit.base'
include_recipe 'littleobi-base-linux::pkg.install.firewalld'
include_recipe 'littleobi-base-linux::pkg.install.virtualization'
include_recipe 'littleobi-base-linux::pkg.install.virtualbox'
include_recipe 'littleobi-base-linux::reinit.base'
include_recipe 'littleobi-kube::default'
include_recipe 'littleobi-base-linux::pkg.install.gns3'
include_recipe 'littleobi-base-linux::pkg.install.glusterfs'
include_recipe 'littleobi-base-linux::config.firewalld.glusterfs'
include_recipe 'littleobi-base-linux::reinit.base'
include_recipe 'littleobi-base-linux::pkg.install.realmd'
include_recipe 'littleobi-base-linux::pkg.install.haproxy'
include_recipe 'littleobi-base-linux::reinit.base'
