
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

default['littleobi']['Virtualbox']['enabled'] = false
default['littleobi']['virt-tools']['enabled'] = false

default['littleobi']['gns3']['enabled'] = false

default['littleobi']['vscode']['enabled'] = false
default['littleobi']['cockpit']['enabled'] = false
default['littleobi']['hashicrop']['enabled'] = false

default['littleobi']['terraform']['install'] = false
default['littleobi']['packer']['install'] =  false
default['littleobi']['vagrant']['install'] = false

default['littleobi']['awscli']['enabled'] = false
default['littleobi']['azurecli']['enabled'] = false
default['littleobi']['powershell']['enabled'] = false

default['littleobi']['iscsi-tools']['enabled'] = false
default['littleobi']['haproxy']['enabled'] = false
default['littleobi']['glusterfs']['enabled'] = true
default['littleobi']['heketi']['enabled'] = true

default['littleobi']['selinux-tools']['enabled'] = true


default['littleobi']['btrfs']['enabled'] = false
default['littleobi']['ntfs']['enabled'] = false
default['littleobi']['lvm2']['enabled'] = true
default['littleobi']['exfat']['enabled'] = true

default['littleobi']['ad-tools']['enabled'] = false
default['littleobi']['tpm-tools']['enabled'] = false

default['littleobi']['pwgen-tools']['enabled'] = false


default['littleobi']['tpmv2'] = true