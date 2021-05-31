#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'littleobi-base-linux::init.kube'
include_recipe 'littleobi-base-linux::docker.pkg.install.kube'
include_recipe 'littleobi-base-linux::docker.pkg.config.kube'
include_recipe 'littleobi-base-linux::selinux.config.kube'
include_recipe 'littleobi-base-linux::firewalld.config.kube'
include_recipe 'littleobi-base-linux::network.config.kube'
include_recipe 'littleobi-base-linux::kube.pkg.install.kube'