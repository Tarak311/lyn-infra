property :flag, String, default: '-y'
  action :upgrade do
    bash 'update' do
      code <<-EOH
      dnf -y upgrade
      EOH
      action :run
    end
  end
