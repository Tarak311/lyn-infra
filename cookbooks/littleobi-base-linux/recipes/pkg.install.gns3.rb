
bash 'Clean rpm/yum/dnf chache' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      dnf clean all
      yum update -y
      EOH
end
  
  
dnf_package 'gns3-tools' do
    flush_cache [ :after ]
    package_name   %w(python3-devel elfutils-libelf-devel python3-pyqt5-sip python3-qt5 xterm cmake libpcap-devel)
    action         :install # defaults to :install if not specified
end

yumgroup 'Development Tools' do
    action :upgrade
end
package 'git' do   action :install  end

git "/home/vagrant/gns3-srv" do
    repository 'git://github.com/GNS3/gns3-server.git'
    revision 'master'
    action :checkout
end

git "/home/vagrant/gns3-gui" do
    repository 'git://github.com/GNS3/gns3-gui.git'
    revision 'master'
    action :checkout
end

git "/home/vagrant/vpcs" do
    repository 'git://github.com/GNS3/vpcs.git'
    revision 'master'
    action :checkout
end

git "/home/vagrant/dynamips" do
    repository 'git://github.com/GNS3/dynamips.git'
    revision 'master'
    action :checkout
end

git "/home/vagrant/ubridge" do
    repository 'git://github.com/GNS3/ubridge.git'
    revision 'master'
    action :checkout
end

bash 'Install gns3-server' do
    user 'root'
    cwd '/home/vagrant/gns3-srv/'
    code <<-EOH
    sudo pip3 install -r requirements.txt
    sudo python3 setup.py install
    EOH
  end



bash 'Install gns3-gui' do
    user 'root'
    cwd '/home/vagrant/gns3-gui/'
    code <<-EOH
    sudo pip3 install -r requirements.txt
    sudo python3 setup.py install
    sudo cp resources/linux/applications/gns3.desktop /usr/share/applications/
    sudo cp -R resources/linux/icons/hicolor/ /usr/share/icons/
    EOH
end



bash 'Install vpcs' do
    user 'root'
    cwd '/home/vagrant/vpcs/src'
    code <<-EOH
    sudo ./mk.sh
    sudo cp vpcs /usr/local/bin/vpcs
    EOH
end



bash 'Install dynamips' do
    user 'root'
    cwd '/home/vagrant/dynamips/'
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
    cwd '/home/vagrant/ubridge/'
    code <<-EOH
    make
    sudo make install
    EOH
end


