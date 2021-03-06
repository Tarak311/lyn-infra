#
# Cookbook::  chef-client
# Recipe:: service
#
# Author:: Joshua Timberman (<joshua@chef.io>)
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Author:: Paul Mooring (<paul@chef.io>)
#
# Copyright:: 2009-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

supported_init_styles = %w(
  bsd
  init
  launchd
  smf
  src
  systemd
  windows
)

init_style = node['chef_client']['init_style']

raise "The init style specified at node['chef_client']['init_style'] is not supported by the chef-client cookbook. Supported values are: #{supported_init_styles.join(',')}." unless supported_init_styles.include?(init_style)

include_recipe "chef-client::#{init_style}_service"
