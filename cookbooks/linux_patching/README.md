# linux_patching

[![Cookbook Version](https://img.shields.io/cookbook/v/linux_patching.svg)](https://supermarket.chef.io/cookbooks/linux_patching)
[![pipeline status](https://gitlab.com/dg42/chef_linux_patching/badges/master/pipeline.svg)](https://gitlab.com/dg42/chef_linux_patching/commits/master)

## Description
A Chef cookbook to patch Linux nodes, based on Brian Fald's (@bflad) [`chef-auto-patch`](https://github.com/bflad/chef-auto-patch) cookbook.  Provides the ability to configure three patching windows/stages: pre-configuration, patching, and post-configuration.  Also updated to support the latest version of chef-client, additional OSes, and newer versions of existing OS varieties.

## Requirements

### Platforms
* amazon
* arch
* centos
* debian
* redhat
* ubuntu

### Cookbooks
* cron

## Stages
* **pre_config** - disabled by default.  Allows preparation scripts to be run, such as preparing/cleaning the system, pre-downloading patches, or notifying external systems.  Can help speed up patching process and meet patching timeframes.
* **patch** - the primary patching stage.  This stage is enabled by default and will run the node platform's patch script in the templates directory.
* **post_config** - disabled by default.  Allows for checkout scripts to be run, such as verifying system state, rebooting at a later date, or notifying external systems.  Use this to run tasks at a set scheduled time after the completion of the patching stage.

## Attributes
The following is a hash of options that can be set for a stage, where stage is one of `patch`, `pre_config`, or `post_config`.  See the [Examples](#examples) section for more details.

Attribute | Description | Type | Default
-|-|-|-
enable | Controls if the stage is enabled. | Boolean | `true` for patching stage, otherwise false
hour | Hour to patch at. | Integer | 3
minute | Minute to patch at. | Integer | 0
monthly | Enable patching on a monthly interval corresponding to the textual week number (first, second, etc.) and weekday (monday, tuesday, etc.).  Overridden by the `weekly` attribute. | String | nil
platforms | Not yet supported.  Platforms that the patching schedule applies to.  Chef will not manage patching on the node if its platform is not one specified. | String | all
reboot | Controls if reboots are performed immediately after patching. | Boolean | false
splay | Seconds of random delay before beginning patching. | Integer | 0
weekly | Enable patching on a weekly interval corresponding to the textual weekday (monday, tuesday, etc).  Overrides the `monthly` attribute. | String | sunday
script | The sequential commands to run for the stage's script. | Array | varies, see `/attributes/default.rb`

## Recipes
* `recipe['linux_patching']` - configures automatic patching.

## Usage
* Update attributes as desired
* Update script templates
* Add recipe to node run list

## Examples

### Enable weekly patching with reboots
```ruby
node['linux_patching']['patch'] = {
  'enable' => true,
  'hour' => 3,
  'minute' => 0,
  'monthly' => nil,
  'platforms' => 'all',
  'reboot' => true,
  'splay' => 0,
  'weekly' => 'sunday',
}
```

### Enable monthly patching with no reboot
```ruby
node['linux_patching']['patch'] = {
  'enable' => true,
  'hour' => 2,
  'minute' => 30,
  'monthly' => 'second tuesday',
  'platforms' => 'all',
  'reboot' => false,
  'splay' => 300,
  'weekly' => nil,
}
```

### Disable patching entirely on a node
```ruby
node['linux_patching']['patch']['enable'] = false
node['linux_patching']['pre_config']['enable'] = false
node['linux_patching']['post_config']['enable'] = false
```

## TODO
The following is a list of things I would like to eventually add to this cookbook.  Feel free to contribute by raising an issue or pull request to this project in GitLab.

- Improve InSpec tests
- Provide example pre_config and post_config scripts
- Add ability to "run now".  Thought is to have an attribute that when set to true, will run the patch process/scripts at the next chef-client run.
- Add support for the 'platforms' attribute within a stage.
