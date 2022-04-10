chef install primary_linux.rb  
chef update primary_linux.rb   
chef install worker_linux.rb 
chef update worker_linux.rb   
chef push server primary_linux.lock.json 
chef push workstation primary_linux.lock.json
chef push server worker_linux.lock.json
chef push workstation worker_linux.lock.json

