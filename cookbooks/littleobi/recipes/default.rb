#
# Cookbook:: littleobi
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::config.user'
include_recipe 'yum::default'


#include_recipe 'littleobi::config.bento'
include_recipe 'littleobi::config.network'


include_recipe 'littleobi::config.storage'
include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::pkg.install.base'
include_recipe 'littleobi::pkg.install.targetd'
include_recipe 'littleobi::pkg.install.selinux'
include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::pkg.install.firewalld'
include_recipe 'littleobi::pkg.install.virtualization'
include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::pkg.install.vscode'
include_recipe 'littleobi::pkg.install.hashicrop'
include_recipe 'littleobi-kube::default'
#include_recipe 'littleobi::pkg.install.gns3'
include_recipe 'littleobi::pkg.install.glusterfs'
include_recipe 'littleobi::config.glusterfs'
include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::pkg.install.realmd'
include_recipe 'littleobi::pkg.install.haproxy'
include_recipe 'littleobi::reinit.base'
include_recipe 'littleobi::pkg.install.tpm'
include_recipe 'littleobi::config.tmux'

include_recipe 'littleobi::pkg.install.heketi'
include_recipe 'littleobi::config.heketi'
