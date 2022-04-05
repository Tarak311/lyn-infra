## BUGS FOUNDS  LIBPCAP DEVEL IS NOT GETTING INSTALL AS POWERTOOL REPO IN NOT ENABLED, GIT PROTO IS outdated    
if  node['littleobi']['gns3']['enabled'] # This variable is set in attributes file (default is false) Set true to enable this package.
    if (node['platform'] =="centos" || node['platform'] =="fedora")
        include_recipe 'littleobi::reinit.base'
        

        dnf_package 'gns3-tools' do
            flush_cache [ :after ]
            package_name   %w(python3-devel elfutils-libelf-devel python3-pyqt5-sip python3-qt5 xterm cmake libpcap-devel)
            action         :install # defaults to :install if not specified
        end

        yumgroup 'Development Tools' do
            action :upgrade
        end
        package 'git' do   action :install  end

        git "/tmp/gns3-srv" do
            repository 'git://github.com/GNS3/gns3-server.git'
            revision 'master'
            action :checkout
        end

        git "/tmp/gns3-gui" do
            repository 'git://github.com/GNS3/gns3-gui.git'
            revision 'master'
            action :checkout
        end

        git "/tmp/vpcs" do
            repository 'git://github.com/GNS3/vpcs.git'
            revision 'master'
            action :checkout
        end

        git "/tmp/dynamips" do
            repository 'git://github.com/GNS3/dynamips.git'
            revision 'master'
            action :checkout
        end

        git "/tmp/ubridge" do
            repository 'git://github.com/GNS3/ubridge.git'
            revision 'master'
            action :checkout
        end

        bash 'Install gns3-server' do
            user 'root'
            cwd '/tmp/gns3-srv/'
            code <<-EOH
            sudo pip3 install -r requirements.txt
            sudo python3 setup.py install
            EOH
        end



        bash 'Install gns3-gui' do
            user 'root'
            cwd '/tmp/gns3-gui/'
            code <<-EOH
            sudo pip3 install -r requirements.txt
            sudo python3 setup.py install
            sudo cp resources/linux/applications/gns3.desktop /usr/share/applications/
            sudo cp -R resources/linux/icons/hicolor/ /usr/share/icons/
            EOH
        end



        bash 'Install vpcs' do
            user 'root'
            cwd '/tmp/vpcs/src'
            code <<-EOH
            sudo ./mk.sh
            sudo cp vpcs /usr/local/bin/vpcs
            EOH
        end



        bash 'Install dynamips' do
            user 'root'
            cwd '/tmp/dynamips/'
            code <<-EOH
            sudo mkdir build 
            cd build/
            sudo cmake ..
            sudo make
            sudo make install
            EOH
        end


        bash 'Install ubridge' do
            user 'root'
            cwd '/tmp/ubridge/'
            code <<-EOH
            make
            sudo make install
            EOH
        end
    elsif  (node['platform'] =="ubuntu" || node['platform'] =="mint")

        package 'software-properties-common'

        apt_update 'after_update_gns3' do
            ignore_failure true
            action :update
            subscribes :add, 'resource[gns3-repo]', :immediately
        end
        
        bash 'add_32-bit_support' do
            user 'root'
            cwd '/tmp/'
            code <<-EOH
                dpkg --add-architecture i386
            EOH
        end

        apt_repository 'gns3-repo' do
            uri          'ppa:gns3/ppa'
            action :add
        end

        package 'gns3-tools' do
            package_name   %w(gns3-gui gns3-server gns3-iou)
            action         :install # defaults to :install if not specified
        end        
    end
    
    include_recipe 'littleobi-kube::pkg.install.docker'
    group_list = ["ubridge", "libvirt", "kvm", "wireshark"]
    group_list.each { |x| 
        group "#{x}" do
            append true
            members %w(administrator)
            action :create
        end
    }
end