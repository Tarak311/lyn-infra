#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'linux_patching::init'
include_recipe 'linux_patching::docker.pkg.install'
include_recipe 'linux_patching::docker.pkg.config'
include_recipe 'linux_patching::selinux.config'
include_recipe 'linux_patching::firewalld.config'
include_recipe 'linux_patching::network.config'
include_recipe 'linux_patching::kube.pkg.install'