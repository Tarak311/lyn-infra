# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'kubernetes'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'kubernetes::default'

# Specify a custom source for a single cookbook:
cookbook 'kubernetes', path: '.'
cookbook 'yumgroup', '~> 0.6.0', :supermarket
cookbook 'selinux', '~> 3.1.1', :supermarket
cookbook 'resolver', '~> 3.0.4', :supermarket
cookbook 'firewalld', '~> 1.2.1', :supermarket
