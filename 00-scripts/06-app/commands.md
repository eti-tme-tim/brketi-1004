### Switch to EKS
git clone --depth 1 --branch v0 https://github.com/GoogleCloudPlatform/microservices-demo.git 
kubectl create namespace microservices
kubectl -n microservices apply -f ./microservices-demo/release/kubernetes-manifests.yaml
kubectl -n microservices get svc frontend-external

### Add Istio
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.21.2
export PATH=$PWD/bin:$PATH

# Install Istio
istioctl install --set profile=demo –y

# Label the namespace(s) you want to inject Istio sidecar proxies into
kubectl -n microservices get pods
kubectl label namespace microservices istio-injection=enabled
kubectl -n microservices rollout restart deployment
kubectl -n microservices get pods --watch
