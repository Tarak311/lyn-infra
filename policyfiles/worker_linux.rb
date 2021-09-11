# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'worker_linux'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'os-hardening::default', 'worker_node::default'

# Specify a custom source for a single cookbook:
cookbook 'worker_node', path: '../cookbooks/worker_node/'
cookbook 'primary_server', path: '../cookbooks/primary_server/'
cookbook 'littleobi', path: '../cookbooks/littleobi/'
cookbook 'littleobi-kube','= 0.0.1', path: '../cookbooks/littleobi-kube/'
cookbook 'selinux', '~> 3.1.1', :supermarket
cookbook 'os-hardening', '= 4.0.0', :supermarket
cookbook 'yumgroup', '~> 0.6.0', :supermarket
cookbook 'yum-centos', '~> 5.1.1', :supermarket
cookbook 'yum', '~> 6.1.1', :supermarket
