# The chef-repo

All installations require a central workspace known as the chef-repo. This is a place where primitive objects--cookbooks, roles, environments, data bags, and chef-repo configuration files--are stored and managed.

The chef-repo should be kept under version control, such as [git](https://git-scm.com/), and then managed as if it were source code.

## Knife Configuration

Knife is the [command line interface](https://docs.chef.io/workstation/knife/) for Chef. The chef-repo contains a .chef directory (which is a hidden directory by default) in which the knife configuration file (config.rb) is located. This file contains configuration settings for the chef-repo.

The starter kit automatically creates the `config.rb` file. This file can be customized to support configuration settings used by [cloud provider options](https://docs.chef.io/plugin_knife/) and custom [knife plugins](https://docs.chef.io/plugin_knife_custom/).

Also located inside the .chef directory are .pem files, which contain private keys used to authenticate requests made to the Chef Infra Server. The USERNAME.pem file contains a private key unique to the user (and should never be shared with anyone). The ORGANIZATION-validator.pem file contains a private key that is global to the entire organization (and is used by all nodes and workstations that send requests to the Chef Infra Server).

For more information about the `config.rb` options, see the [knife](https://docs.chef.io/workstation/config_rb/) documentation.

## Cookbooks    

A cookbook is the fundamental unit of configuration and policy distribution. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to the Chef Infra Server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

## Roles

Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

## Getting Started

Now that you have the chef-repo ready to go, check out [Learn Chef](https://learn.chef.io/) to proceed with your workstation setup. If you have any questions about Chef you can always ask [our support team](https://www.chef.io/support/) for a helping hand.


## Instructions for cookbook and when creating their own infrastructure:

There are few requirments to be taken care of before bootstrapping any node.

1. There should be an administrator account and this should be in wheel group.
2. There should be sudo access through ssh and ssh-server should be on.
3. `/data/docker/images` should exist and there should be serperate LV volume with VDO at the base.
4. `/home/administrator/priv` and  `/priv` should exist and there should be serperate LV volume with LUKS at the base.
5. Make sure that `/data/heketi/config` and `/data/share/pubkey` are mounted with luks.
6. Make sure that `/data/heketi/db` is mounted with high iops disk (primary_server).

## Instructions for heketi-cli:

There are post task for heketi-cli that you can do.

1. copy ssh-ids to all the server to designated accounts.
2. change default password in 'vi /data/heketi/config/heketi.json', this should be 23rd and 28th line.
3. `docker run -d -p 8080:8080--name  heketi-0   -e HEKETI_CLI_USER=admin -e HEKETI_CLI_KEY=qwertyuiop -v /data/heketi/config:/etc/heketi -v /data/heketi/db:/var/lib/heketi heketi/heketi` for running heketi-cli server after chef-client has ran in primary_server 
4. Run 'docker -it heketi-3 bash'
5. Add nodes to cluster(you have to create one first) make sure use
`heketi-cli node add --zone 1 --cluster <clutser-id> --management-hostname <hostname> --storage-host-name  <ip-address>`
6. Add devices ` heketi-cli device add --name /dev/nvme* --node <node-id>`
## Instruction for bootstraping nodes 

1. Find the join commands in `/data/share/private`. 
2. It should be something like: 

```kubeadm join [ip]:6443 --token [your-token] --discovery-token-ca-cert-hash sha256:[hash]```

OR

you can create new one 

`sudo kubeadm token create --print-join-command > joinkubecluster.sh`

3. Run the command and enjoy!!!


## Infra View

cs_north - fast ssd  /usr - 10G /opt - 2G  /var- 10G  /home - 20G   / - 10G      
cs_south - slow hdd    /tmp   - 30G                         40G
cs_north_vdo - docker_images                                30G
cs_north_luks /priv - 2G  /home/user/.priv/  - 1G           10G
cs_south_luks /data/priv                                    20G

/dev/sda8 - docker_data_south      cluster_south            40G
/dev/nvmep1n8 docker_data_north    cluster_north            20G

/dev/sda10 - docker_data_south_priv      cluster_south_luks 30G
/dev/nvmep1n10 docker_data_north_priv    cluster_north_luks 10G



1) "/data/store"  BULK HDD  20 GiB Which Stores OS Images and Stuff /dev/sdax
2) "/data/share" ISCSI or GLUSTER/NFS  which stores data to be shared like config files and other data like codes workspace lives in this directory  /dev/sdax with iscsi

3)  "/data/priv" Store Private Stuff like keys which is not exported by ISCSI 2 GiB /dev/sdax
4) "/data/share/priv" Backed by Shared LUKS ISCSI per each device /dev/sdax <=rsync=>
5)  /data/priv/heketi SSD with lUKS 1  GIB /dev/nvme0n1px 

so first /data/priv gets unlocked and then with that /data/share/priv get unlocked and then /data/priv/heketi gets unlocked and rsync starts

so 2x1 GiB nvme with luks

30GB HDD local 
30 GB HDD for Sharing # not for everyone


2 GB per each device luks sharing  
2 GB private data

60 GB HDD Plain  VG_SOUTH
30 GB with LUKS LUKS_BG_SOUTH

20 GB NVME LUKS luks_vg_north

30 GB for DOCKER IMAGES VDO NVME if more is required then add HDD vdo_docker


1) 60 | 30 GB cs_south VG
2) 30 GB | 10 luks_cs_south VG
3) 10 GB |10 luks_cs_north VG
4) 30 GB | 30  vdo_cs_north VG

50 GB   80  


1) 1x30 GB for Storage Images and other stuff 1x30 GB for Other Stuff for Sharing
2) 1x2 GB for Private data 5x2 GB for each node for storing data rest of the data is for slack
3) 1x1GB for heketi data for now rest is for expansiom ssd
4) for docker   

So our script will make sure the required VD exists and required space is there
if the space is less the it will check that partion exist or not
if not then proced incresing the size by creating PV

Arg

type of device VAULT 
Number for Storage 1 or 2 or 3
SSD exist 0|1
HDD Exist 0|1


