# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'littleobi'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'littleobi::default'

# Specify a custom source for a single cookbook:
cookbook 'littleobi', path: '.'
cookbook 'littleobi-kube','= 0.0.1', path: '../littleobi-kube/'
cookbook 'selinux', '~> 3.1.1', :supermarket
cookbook 'os-hardening', '= 4.0.0', :supermarket
cookbook 'yumgroup', '~> 0.6.0', :supermarket
cookbook 'yum-centos', '~> 5.1.1', :supermarket
cookbook 'yum', '~> 6.1.1', :supermarket