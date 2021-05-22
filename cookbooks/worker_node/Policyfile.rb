# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'worker_node'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'os-hardening::default', 'chef-client::default','worker_node::default'

# Specify a custom source for a single cookbook:
cookbook 'worker_node', path: '.'
cookbook 'os-hardening', '= 4.0.0' , :supermarket
cookbook 'chef-client', '~> 12.3.4', :supermarket
cookbook 'littleobi-base-linux', path: '../littleobi-base-linux/'
cookbook 'yumgroup', '~> 0.6.0', :supermarket
cookbook 'selinux', '~> 3.1.1', :supermarket
cookbook 'linux_patching', '~> 0.1.2', path: '../linux_patching/'