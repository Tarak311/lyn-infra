
dnf_package 'gns3-tools' do
    flush_cache [ :after ]
    package_name   %w(python3-devel elfutils-libelf-devel libpcap-devel python3-pyqt5-sip python3-qt5 xterm cmake)
    action         :install # defaults to :install if not specified
end

yumgroup 'Development Tools' do
    action :upgrade
end

