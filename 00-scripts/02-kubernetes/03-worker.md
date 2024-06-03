# Work Node Setup

## Extract Join Command

```
sudo kubeadm token create --print-join-command
```

## Join the compute nodes

## Copy the .kube/config from master node

```
mkdir -p ${HOME}/.kube
cat > ${HOME}/.kube/config <<EOF
EOF
```

## Label the compute nodes

kubectl label node worker-node1 node-role.kubernetes.io/worker-node=
kubectl label node worker-node2 node-role.kubernetes.io/worker-node=

## View nodes

kubectl get nodes
kubectl describe nodes