# Cheat sheet of commands

```
kubectl apply -f port8080-pod.yaml
kubectl logs port8080-pod

kubectl apply -f command-pod.yaml
kubectl logs command-pod

kubectl apply -f env-pod.yaml
kubectl exec env-pod -- printenv

kubectl apply -f airline-kiosk.yaml -f configmap-pod.yaml 
kubectl exec configmap-pod -- printenv


kubectl create secret generic credentials \
--from-literal=USERNAME_1=tim_szigeti \
--from-literal=PASSWORD_1=admin \
--from-literal=USERNAME_2=tim_miller \
--from-literal=PASSWORD_2=Cisco123 

kubectl describe secret credentials
kubectl apply -f secret-pod.yaml


kubectl apply -f sidecar-logger-pod.yaml
kubectl logs sidecar-logger --container=sidecar
kubectl exec secret-pod -- printenv
