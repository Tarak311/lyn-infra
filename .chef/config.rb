# See http://docs.chef.io/workstation/config_rb/ for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tarak311"
client_key               "#{current_dir}/tarak311.pem"
chef_server_url          "https://api.chef.io/organizations/litleobi"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:vault_mode] = 'client'
knife[:vault_admins] = [ 'tarak311' ]