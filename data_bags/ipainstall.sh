mkdir -rf /var/lib/ipa-data/
sudo rm -rf /var/lib/ipa-data/*
sudo systemctl stop firewalld  
sudo systemctl restart docker
sudo docker run -it -h ipadc-0.linux.littleobi.com --name ipadc-0.linux.littleobi.com -p 80:80 -p 443:443 -p 389:389 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /var/lib/ipa-data:/data:Z -e PASSWORD=Lalohel311@1994A --sysctl net.ipv6.conf.all.disable_ipv6=0 freeipa/freeipa-server:centos-8-4.8.7 ipa-server-install -U -r LINUX.LITTLEOBI.COM --no-ntp     