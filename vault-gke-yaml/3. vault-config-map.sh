# Provision IP Address (Replace COMPUTE_REGION and PROJECT_ID Accordingly)
gcloud compute addresses create vault   --region us-east4   --project corrigan-gcp

# Set Env Var
VAULT_LOAD_BALANCER_IP=$(gcloud compute addresses describe vault   --region us-east4   --project corrigan-gcp   --format='value(address)')

# Create vault.hcl config
cat <<EOF > vault.hcl
storage "consul" {
 address = "127.0.0.1:8500"
 path = "vault/"
 }
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = "true"
}
disable_mlock="true"
disable_cache="true"
ui = "true"

max_least_ttl="10h"
default_least_ttl="10h"
raw_storage_endpoint=true
cluster_name="mycompany-vault"
EOF


# Create Vault Config Map

#kubectl create ns vault-deploy

kubectl create configmap vault --from-literal api-addr=https://${VAULT_LOAD_BALANCER_IP}:8200 --from-file=vault.hcl -n vault-deploy

#kubectl delete configmap vault
