# Cheat sheet

kubectl apply -f mars-viewer-sa.yaml
kubectl apply -f pod-viewer-role.yaml
kubectl apply -f mars-pv-rb.yaml
kubectl get rolebinding mars-pv-rb --namespace=mars --output=wide

kubectl apply -f cluster-deployer-sa.yaml
kubectl apply -f create-deploy-cr.yaml
kubectl apply -f cluster-deploy-crb.yaml
kubectl get clusterrolebinding cluster-deploy-crb --output=wide

kubectl apply -f mars-sa-pod.yaml
kubectl describe pod  mars-sa-pod --namespace=mars

kubectl auth can-i get pods
kubectl auth can-i create deployments
kubectl auth can-i get pods --namespace=mars --as=system:serviceaccount:mars:mars-viewer
kubectl auth can-i create deployments --namespace=mars --as=system:serviceaccount:mars:mars-viewer
kubectl auth can-i create deployments --namespace=mars --as=system:serviceaccount:kube-system:cluster-deployer
kubectl auth can-i create deployments --namespace=venus --as=system:serviceaccount:kube-system:cluster-deployer
kubectl auth can-i get pods --namespace=mars --as=system:serviceaccount:kube-system:cluster-deployer
