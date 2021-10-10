
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

default['littleobi']['nilfguard']['ip'] = "192.168.4.251"
default['littleobi']['dragonden']['ip'] = "192.168.4.245"
default['littleobi']['dragonvein']['ip'] = "192.168.4.3"
default['littleobi']['dragowitch']['ip'] = "192.168.4.173"
default['littleobi']['dragox']['ip'] = "192.168.4.12"
default['littleobi']['adds']['ip'] = "192.168.4.10"
default['littleobi']['subca']['ip'] = "192.168.4.20"

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

default['littleobi']['role']['primary'] = false
default['littleobi']['role']['worker'] = false
default['littleobi']['node']['storage_cfg']['priv_root'] = "/priv/"
default['littleobi']['node']['storage_cfg']['priv_heketi_keys_certs'] = "/priv/heketi"
default['littleobi']['node']['storage_cfg']['priv_administrator'] = "/home/administrator/.priv"
default['littleobi']['node']['storage_cfg']['data_share'] = "/data/share"
default['littleobi']['node']['storage_cfg']['data_priv'] = "/data/priv"
default['littleobi']['node']['storage_cfg']['data_priv_heketi'] = "/data/priv/heketi"
default['littleobi']['node']['storage_cfg']['data_priv_heketi_config'] = "/data/priv/heketi/cfg"
default['littleobi']['node']['storage_cfg']['data_priv_heketi_db'] ="/data/priv/heketi/db"


default['littleobi']['node']['storage_cfg']['disk']['kube_data_hdd_blk'] = "/dev/sda8" #50G
default['littleobi']['node']['storage_cfg']['disk']['kube_data_ssd_blk'] = "/dev/nvme0n1p4" #20G 
default['littleobi']['node']['storage_cfg']['disk']['kube_data_ssd_luks'] = "/dev/nvme0n1p5" #10G
default['littleobi']['node']['storage_cfg']['disk']['kube_data_hdd_luks'] = "/dev/sda9" #30G


default['littleobi']['node']['storage_cfg']['disk']['data'] = "/dev/sda10" # 40G cs_node_data_south /dev/nvme0n1p7

default['littleobi']['node']['storage_cfg']['disk']['data_ssd'] = "/dev/nvme0n1p6" #30G for cs_node_data_north if no ssd /dev/sda11


