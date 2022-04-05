if node['littleobi']['heketi']['enabled']

    heketi_modules = ["dm_snapshot", 'dm_mirror', 'dm_thin_pool']
    heketi_modules.each { |x| 
        kernel_module 'x' do
        action          :install # defaults to :install if not specified
      end 
    }
  group 'heketi' do
      append true
      members %w(administrator storageadm)
      action :create
  end
end

