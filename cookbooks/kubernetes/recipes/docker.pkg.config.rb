yum_repository 'virtualbox' do
    baseurl 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch'
    description     'This is repo for virtualbox'
    enabled         true
    gpgcheck        true
    gpgkey          'https://www.virtualbox.org/download/oracle_vbox.asc'
  end
  