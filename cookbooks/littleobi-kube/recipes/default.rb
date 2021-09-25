#
# Cookbook:: littleobi-kube
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'littleobi-kube::init.kube'
include_recipe 'littleobi-kube::pkg.install.docker'
include_recipe 'littleobi-kube::pkg.config.docker'
include_recipe 'littleobi-kube::selinux.config.kube'
include_recipe 'littleobi-kube::firewalld.config.kube'
include_recipe 'littleobi-kube::network.config.kube'
include_recipe 'littleobi-kube::pkg.install.kube'