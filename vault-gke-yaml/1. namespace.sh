kubectl create ns vault-deploy
kubectl get ns

kubectl config view
kubectl config current-context 

export GKE_CLUSTER=gke_corrigan-gcp_us-east4-a_k8s-corrigan
export GKE_USER=gke_corrigan-gcp_us-east4-a_k8s-corrigan

kubectl config set-context vault-deploy --namespace=vault-deploy \
  --cluster=${GKE_CLUSTER} \
  --user=${GKE_USER}

#Switch Context
kubectl config use-context vault-deploy 

# List Contexts
kubectl config get-contexts

#To Delete Context
#kubectl config delete-context vault-deploy
