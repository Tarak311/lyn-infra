case node['platform']
when 'redhat'
    bash 'disable swap' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        sudo sed -i '/ swap / s/^/#/' /etc/fstab
        EOH
    end

    dnf_package 'zram-generator-defaults' do 
        action :remove
    end

    service 'swap-create@zram0' do
        pattern 'swap-create@zram0' 
        subscribes  :stop , 'dnf_package[zram-generator-defaults], :immediately'
    end

    bash 'Init as master' do
        user 'root'
        cwd '/tmp/'
        code <<-EOH
        sudo swapoff -a
        sudo kubeadm init > ./kubeadm.log
        EOH
        not_if { ::File.exist?('/tmp/kubeadm.log') }
    end
    
    
    bash 'allowing users' do
        user 'root'
        cwd '/tmp/'
        code <<-EOH
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config
        export kubever=$(kubectl version | base64 | tr -d '\n')
        kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
        EOH
    end
    
    
    bash 'generate_token' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        KUBETOKEN=$(kubeadm token create --print-join-command)
        EOH
    end
    

when 'fedora'
    bash 'disable swap' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        sudo sed -i '/ swap / s/^/#/' /etc/fstab
        EOH
    end

    dnf_package 'zram-generator-defaults' do 
        action :remove
    end

    service 'swap-create@zram0' do
        pattern 'swap-create@zram0' 
        subscribes  :stop , 'dnf_package[zram-generator-defaults], :immediately'
    end

    bash 'Init as master' do
        user 'root'
        cwd '/tmp/'
        code <<-EOH
        sudo swapoff -a
        sudo kubeadm init > ./kubeadm.log
        EOH
        not_if { ::File.exist?('/tmp/kubeadm.log') }
    end


    bash 'allowing users' do
        user 'root'
        cwd '/tmp/'
        code <<-EOH
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config
        export kubever=$(kubectl version | base64 | tr -d '\n')
        kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
        EOH
    end


    bash 'generate_token' do
        user 'root'
        cwd  '/tmp'
        code <<-EOH
        KUBETOKEN=$(kubeadm token create --print-join-command)
        EOH
    end

end