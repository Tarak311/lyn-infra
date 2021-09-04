
override['yum']['powertools']['enabled'] = true
default['yum']['main']['exclude'] = nil
node.override['yum']['powertools']['managed'] = true
node.override['yum']['powertools']['enabled'] = true

# Packages Installed

default['littleobi']['virtualbox']['enabled'] = false
default['littleobi']['kvm']['enabled'] = false
default['littleobi']['gns3']['enabled'] = false
default['littleobi']['kube']['enabled'] = false

default['littleobi']['vscode']['enabled'] = false
default['littleobi']['cockpit']['enabled'] = false
default['littleobi']['hashicrop']['enabled'] = false

default['littleobi']['terraform']['install'] =  false
default['littleobi']['packer']['install'] =  false
default['littleobi']['vagrant']['install'] = false

default['littleobi']['awscli']['enabled'] = false
default['littleobi']['azurecli']['enabled'] = false
default['littleobi']['powershell']['enabled'] = false

default['littleobi']['tmux']['enabled'] = false
default['littleobi']['screen']['enabled'] = false
default['littleobi']['htop']['enabled'] = false


default['littleobi']['targetd']['enabled'] = false
default['littleobi']['haproxy']['enabled'] = false
default['littleobi']['glusterfs']['enabled'] = false
default['littleobi']['heketi']['enabled'] = false

default['littleobi']['selinux']['enabled'] = false
default['littleobi']['firewalld']['enabled'] = false


default['littleobi']['btrfs']['enabled'] = false
default['littleobi']['fatfs']['enabled'] = false
default['littleobi']['ntfs']['enabled'] = false

default['littleobi']['docker']['enabled'] = false
default['littleobi']['podman']['disable'] = true




