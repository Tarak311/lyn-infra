FROM littleobi/centos_base:latest


RUN wget https://packages.chef.io/files/stable/chef-workstation/21.2.278/el/8/chef-workstation-21.2.278-1.el7.x86_64.rpm
RUN yum localinstall -y chef-workstation-* 
COPY . /.chef