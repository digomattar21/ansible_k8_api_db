#install via dnf in redhat
sudo dnf install git -y
sudo yum install python3 -y
sudo yum install python3-pip -y
sudo pip3 install ansible -y
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube /usr/local/bin && sudo chmod +x /usr/local/bin/minikube
sudo yum install libvirt libvirt-daemon-kvm qemu-kvm
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
#minikube start --driver=kvm2
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
cd ansible_k8_api_db
sudo pip install kubernetes
ansible-galaxy collection install community.general kubernetes.core
pip install -r requirements.txt
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
sudo subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
sudo subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo yum install conntrack-tools -y
minikube start --force

