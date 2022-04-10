


#enable vfat for UEFI systems
override['os-hardening']['security']['kernel']['disable_filesystems'] = %w(cramfs freevxfs jffs2 hfs hfsplus squashfs udf )

#enable SELINUX in permissive 

override['os-hardening']['security']['selinux_mode'] = 'permissive'

#enable packages provided by kube cookbook.

override['littleobi']['docker']['enabled'] = true   
override['littleobi']['kubeadm']['enabled'] = true

# Packages Installed
override['littleobi']['role']['primary'] = true 
default['littleobi']['dragonscale']['ip'] = "192.168.4.251"
default['littleobi']['dragonden']['ip'] = "192.168.4.245"
default['littleobi']['dragonvein']['ip'] = "192.168.4.3"
default['littleobi']['dragowitch']['ip'] = "192.168.4.173"
default['littleobi']['dragox']['ip'] = "192.168.4.12"
default['littleobi']['adds']['ip'] = "192.168.4.10"
default['littleobi']['subca']['ip'] = "192.168.4.20"

default['littleobi']['Virtualbox']['enabled'] = false
default['littleobi']['virt-tools']['enabled'] = true    

default['littleobi']['gns3']['enabled'] = false

default['littleobi']['vscode']['enabled'] = true
default['littleobi']['cockpit']['enabled'] = true
default['littleobi']['hashicrop']['enabled'] = true

default['littleobi']['terraform']['install'] = true
default['littleobi']['packer']['install'] =  true
default['littleobi']['vagrant']['install'] = true

default['littleobi']['awscli']['enabled'] = true
default['littleobi']['azurecli']['enabled'] = true
default['littleobi']['powershell']['enabled'] = true

default['littleobi']['iscsi-tools']['enabled'] = true
default['littleobi']['haproxy']['enabled'] = true
default['littleobi']['glusterfs']['enabled'] = true
default['littleobi']['heketi']['enabled'] = true

default['littleobi']['selinux-tools']['enabled'] = true


default['littleobi']['btrfs']['enabled'] = false
default['littleobi']['ntfs']['enabled'] = false
default['littleobi']['lvm2']['enabled'] = true
default['littleobi']['exfat']['enabled'] = true

default['littleobi']['ad-tools']['enabled'] = true
default['littleobi']['tpm-tools']['enabled'] = true

default['littleobi']['pwgen-tools']['enabled'] = true


default['littleobi']['tpmv2'] = true

default['littleobi']['role']['primary'] = false
default['littleobi']['role']['worker'] = false
default['littleobi']['node']['storage_cfg']['priv_administrator'] = "/home/administrator/.priv"
default['littleobi']['node']['storage_cfg']['data_bulk'] = "/data/store" #Storage for Bulk Data this should be HDD only 
## NOTE : NVME is only used when needed there won't be bulk prov for it.

default['littleobi']['node']['storage_cfg']['data_share'] = "/data/share" #Storage for Bulk Shared Data this should be HDD only
default['littleobi']['node']['storage_cfg']['data_priv'] = "/data/priv" #Storage for Bulk Protectd Data this should be HDD only

default['littleobi']['node']['storage_cfg']['data_share'] = "/data/share/priv" # backed by iscsi with LUKS

# heketi cli server should be only one in node and the storage should be in sync with rscync from /data/share/priv/heketi to data/
default['littleobi']['node']['storage_cfg']['data_priv_heketi'] = "/data/priv/heketi" # This should be SSD with Encrytption 
default['littleobi']['node']['storage_cfg']['data_priv_heketi_config'] = "/data/priv/heketi/cfg"
default['littleobi']['node']['storage_cfg']['data_priv_heketi_db'] ="/data/priv/heketi/db"

default['littleobi']['node']['storage_cfg']['docker_images'] = "/data/docker" # this is backed by LVM north 30 GiB




