# Control Plane Creation

## Create control plane components

```
sudo kubeadm init 
```

## Set up Kubernetes authentication

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Add a Container Network Interface (CNI), in this case Weave Net
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s-1.11.yaml 
