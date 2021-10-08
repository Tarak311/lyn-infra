if  node['littleobi']['tpm-tools']['enabled']
    case node['platform']
    when 'centos', 'fedora'
      if node['littleobi']['tpmv2']
        dnf_package 'tpm-tools' do
            flush_cache [ :after ]
            package_name   %w(tpm2-abrmd tpm2-tools)
            action         :install
        end
        
        dnf_package 'trousers' do
            action :remove
        end

        service 'tpm2-abrmd' do
            action [:enable, :start]
        end
          
      else
        
        dnf_package 'trousers' do
            action :install
        end
        
        dnf_package 'tpm-tools' do
            action :install
        end


        
        dnf_package 'pwgen' do
            action :install
        end
        
        

        service 'tscd' do
            action [:enable, :start]
        end

      end  
      
      
    when 'ubuntu'
      package 'tpm-tools' do
        package_name %w(tpm2-abrmd tpm2-tools)
        action :install
      end
      
    end
  end
  
    
  
  
  if  node['littleobi']['pwgen-tools']['enabled']
    case node['platform']
    when 'centos', 'fedora'
        dnf_package 'pwgen' do
            action :install
        end
    end   
  end