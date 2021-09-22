
override['yum']['powertools']['enabled'] = true
default['yum']['main']['exclude'] = nil
node.override['yum']['powertools']['managed'] = true
node.override['yum']['powertools']['enabled'] = true

#enable vfat for UEFI systems
override['os-hardening']['security']['kernel']['disable_filesystems'] = %w(cramfs freevxfs jffs2 hfs hfsplus squashfs udf )

#enable SELINUX in permissive 

override['os-hardening']['security']['selinux_mode'] = 'permissive'

#enable packages provided by kube cookbook.

override['littleobi']['docker']['enabled'] = true   
override['littleobi']['kubeadm']['enabled'] = true

# Packages Installed

default['littleobi']['Virtualbox']['enabled'] = true
default['littleobi']['virt-tools']['enabled'] = true

default['littleobi']['gns3']['enabled'] = true

default['littleobi']['vscode']['enabled'] = true
default['littleobi']['cockpit']['enabled'] = true
default['littleobi']['hashicrop']['enabled'] = true

default['littleobi']['terraform']['install'] = true
default['littleobi']['packer']['install'] =  true
default['littleobi']['vagrant']['install'] = true

default['littleobi']['awscli']['enabled'] = true
default['littleobi']['azurecli']['enabled'] = false
default['littleobi']['powershell']['enabled'] = false

default['littleobi']['iscsi-tools']['enabled'] = true
default['littleobi']['haproxy']['enabled'] = true
default['littleobi']['glusterfs']['enabled'] = true
default['littleobi']['heketi']['enabled'] = true

default['littleobi']['selinux-tools']['enabled'] = true


default['littleobi']['btrfs']['enabled'] = true
default['littleobi']['ntfs']['enabled'] = false
default['littleobi']['lvm2']['enabled'] = true
default['littleobi']['exfat']['enabled'] = true

default['littleobi']['ad-tools']['enabled'] = true




