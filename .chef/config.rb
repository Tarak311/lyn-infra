# See http://docs.chef.io/workstation/config_rb/ for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tarak311"
client_key               "#{current_dir}/tarak311.pem"
chef_server_url          "https://api.chef.io/organizations/litleobi"
cookbook_path            ["#{current_dir}/../cookbooks"]
secret                   "Lalohel311"
editor                   "C:/Users/tarak/AppData/Local/Programs/Microsoft VS Code/code"