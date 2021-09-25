
# This commands will be used for updating policy files and pushing them to chef server

chef install primary_linux.rb  # this will install primary_linux policyfile and create a lockfile

chef update primary_linux.rb   # run this command if lockfile exist

chef install worker_linux.rb  # this will install primary_linux policyfile and create a lockfile

chef update worker_linux.rb   # run this command if lockfile exist




# This command is as follows 'chef push POLICY_GRP POLICY_FILE'


# This command will upload primary_linux policyfile for (lead servers) to server policy_group (for non-workstation without applications)  
# node - dragonvein
chef push server primary_linux.lock.json 

# This command will upload primary_linux policyfile for (lead servers) to workstation policy_group (for workstation with applications)  
# node - none
chef push workstation primary_linux.lock.json

#command for server and worker node
# node - dragowitch,dragox,and dragonden
chef push server worker_linux.lock.json

#command for ws and worker node
# node - nilfguard
chef push workstation worker_linux.lock.json

