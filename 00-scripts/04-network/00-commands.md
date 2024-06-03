for ns in mars venus pluto; do
    kubectl create namespace ${ns}
    for i in 1 2 3; do
        kubectl run ${ns}-pod${i} --namespace=${ns} --image=busybox -- tail -f /dev/null
    done
done

kubectl get namespaces --show-labels
kubectl get pods --namespace=mars --show-labels --output=wide
kubectl get pods --namespace=venus --show-labels --output=wide
kubectl get pods --namespace=pluto --show-labels --output=wide

# CP
kubectl exec -it  mars-pod1 --namespace=mars -- /bin/sh

# W1
kubectl exec -it venus-pod1 --namespace=venus -- /bin/sh

# W2
kubectl exec -it  pluto-pod1 --namespace=pluto -- /bin/sh

# Apply Network Policy
kubectl apply -f 01-deny-all-network-policy.yaml

