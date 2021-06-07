
bash 'Init as master' do
    user 'root'
    cwd '/tmp/'
    code <<-EOH
    sudo swapoff -a
    echo 'sudo kubeadm init >> ./kubeadm.log'>./file
    EOH
end


bash 'allowing users' do
    user 'root'
    cwd '/tmp/'
    code <<-EOH
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    export kubever=$(kubectl version | base64 | tr -d '\n')
    echo 'kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"'
    EOH
end


bash 'generate_token' do
    user 'root'
    cwd  '/tmp'
    code <<-EOH
    KUBETOKEN='(kubeadm token create --print-join-command)'
    EOH
end

