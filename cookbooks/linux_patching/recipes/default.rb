#
# Cookbook:: linux_patching
# Recipe:: default
#
# Copyright:: 2019, Dan Gordon
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

return if platform?('windows')

node.override['cron']['package_name'] = 'cronie' if platform?('arch')
node.override['cron']['service_name'] = 'cronie' if platform?('arch')
include_recipe 'cron'

%w(pre_config patch post_config).each do |stage|
  if node['linux_patching'][stage]['enable']
    action = :create

    if node['linux_patching'][stage]['weekly']
      node.default['linux_patching'][stage]['cron'] = {
        'minute' => node['linux_patching'][stage]['minute'],
        'hour' => node['linux_patching'][stage]['hour'],
        'day' => '*',
        'month' => '*',
        'weekday' => AutoPatch.weekday(node['linux_patching'][stage]['weekly']),
      }
      cron_label = "Schedule patching weekly on #{node['linux_patching'][stage]['weekly']} at #{node['linux_patching'][stage]['hour']}:#{node['linux_patching'][stage]['minute']}"
    elsif node['linux_patching'][stage]['monthly']
      next_date = AutoPatch.next_monthly_date(
        node['linux_patching'][stage]['monthly'],
        node['linux_patching'][stage]['hour'],
        node['linux_patching'][stage]['minute']
      )
      node.default['linux_patching'][stage]['cron'] = {
        'minute' => node['linux_patching'][stage]['minute'],
        'hour' => node['linux_patching'][stage]['hour'],
        'day' => next_date.day,
        'month' => next_date.month,
        'weekday' => '*',
      }
      cron_label = "Schedule patching for #{next_date.strftime('%Y-%m-%d')} at #{node['linux_patching'][stage]['hour']}:#{node['linux_patching'][stage]['minute']}"
    else
      Chef::Application.fatal!('Missing or invalid patch configuration!')
    end
  else
    node.default['linux_patching'][stage]['cron'] = {
      'minute' => nil,
      'hour' => nil,
      'day' => nil,
      'month' => nil,
      'weekday' => nil,
    }
    action = :delete
  end

  template "/usr/local/sbin/linux_patching_#{stage}" do
    source    'stage_script.sh.erb'
    owner     'root'
    group     'root'
    mode      '0700'
    action    action
    variables('script_lines': node['linux_patching'][stage]['script'],
              'stage': stage)
  end

  cron_d cron_label.to_s do
    cron_name "linux_patching_#{stage}"
    hour      node['linux_patching'][stage]['cron']['hour']
    minute    node['linux_patching'][stage]['cron']['minute']
    weekday   node['linux_patching'][stage]['cron']['weekday']
    day       node['linux_patching'][stage]['cron']['day']
    month     node['linux_patching'][stage]['cron']['month']
    command   "/usr/local/sbin/linux_patching_#{stage}"
    action    action
  end
end
