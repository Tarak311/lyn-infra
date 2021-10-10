# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'worker_linux'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list  'os-hardening::default', 'littleobi::default', 'littleobi-kube::init.worker.kube'

# Specify a custom source for a single cookbook:
cookbook 'littleobi', path: '../cookbooks/littleobi/'
cookbook 'littleobi-kube','= 0.0.1', path: '../cookbooks/littleobi-kube/'
cookbook 'selinux', '~> 3.1.1', :supermarket
cookbook 'os-hardening', '= 4.0.0', :supermarket
cookbook 'yumgroup', '~> 0.6.0', :supermarket
cookbook 'yum-centos', '~> 5.1.1', :supermarket
cookbook 'yum', '~> 6.1.1', :supermarket
override['littleobi']['role']['primary'] = false
override['littleobi']['role']['worker'] = true


override['workstation']['littleobi']['Virtualbox']['enabled'] = false
override['workstation']['littleobi']['virt-tools']['enabled'] = true
override['workstation']['littleobi']['gns3']['enabled'] = true
override['workstation']['littleobi']['vscode']['enabled'] = true
override['workstation']['littleobi']['cockpit']['enabled'] = true
override['workstation']['littleobi']['hashicrop']['enabled'] = true
override['workstation']['littleobi']['terraform']['install'] = true
override['workstation']['littleobi']['packer']['install'] =  true
override['workstation']['littleobi']['vagrant']['install'] = true
override['workstation']['littleobi']['awscli']['enabled'] = true
override['workstation']['littleobi']['azurecli']['enabled'] = true
override['workstation']['littleobi']['powershell']['enabled'] = true
override['workstation']['littleobi']['iscsi-tools']['enabled'] = true
override['workstation']['littleobi']['haproxy']['enabled'] = true
override['workstation']['littleobi']['glusterfs']['enabled'] = true
override['workstation']['littleobi']['heketi']['enabled'] = true
override['workstation']['littleobi']['selinux-tools']['enabled'] = true
override['workstation']['littleobi']['btrfs']['enabled'] = false
override['workstation']['littleobi']['ntfs']['enabled'] = false
override['workstation']['littleobi']['lvm2']['enabled'] = true
override['workstation']['littleobi']['exfat']['enabled'] = true
override['workstation']['littleobi']['ad-tools']['enabled'] = true    
override['workstation']['littleobi']['tpm-tools']['enabled'] = true
override['workstation']['littleobi']['pwgen-tools']['enabled'] = true


override['server']['littleobi']['Virtualbox']['enabled'] = false
override['server']['littleobi']['virt-tools']['enabled'] = true
override['server']['littleobi']['gns3']['enabled'] = true
override['server']['littleobi']['vscode']['enabled'] = false
override['server']['littleobi']['cockpit']['enabled'] = false
override['server']['littleobi']['hashicrop']['enabled'] = false
override['server']['littleobi']['terraform']['install'] = false
override['server']['littleobi']['packer']['install'] =  false
override['server']['littleobi']['vagrant']['install'] = false
override['server']['littleobi']['awscli']['enabled'] = false
override['server']['littleobi']['azurecli']['enabled'] = false 
override['server']['littleobi']['powershell']['enabled'] = false    
override['server']['littleobi']['iscsi-tools']['enabled'] = true
override['server']['littleobi']['haproxy']['enabled'] = false
override['server']['littleobi']['glusterfs']['enabled'] = true
override['server']['littleobi']['heketi']['enabled'] = true    
override['server']['littleobi']['selinux-tools']['enabled'] = true        
override['server']['littleobi']['btrfs']['enabled'] = false
override['server']['littleobi']['ntfs']['enabled'] = false
override['server']['littleobi']['lvm2']['enabled'] = true
override['server']['littleobi']['exfat']['enabled'] = true    
override['server']['littleobi']['ad-tools']['enabled'] = true         
