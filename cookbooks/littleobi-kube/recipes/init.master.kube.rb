
bash 'Init as master' do
    user 'root'
    cwd '/home/vagrant/dynamips/'
    code <<-EOH
    sudo swapoff -a
    sudo kubeadm init >> ./kubeadm.log
    EOH
end


bash 'allowing users' do
    user 'root'
    cwd '/home/vagrant/'
    code <<-EOH
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    export kubever=$(kubectl version | base64 | tr -d '\n')
    kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
    EOH
end
