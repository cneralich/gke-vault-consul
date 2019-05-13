# Provision IP Address (Replace COMPUTE_REGION and PROJECT_ID Accordingly)
gcloud compute addresses create vault   --region ${COMPUTE_REGION}   --project ${PROJECT_ID}

# Set Env Var
VAULT_LOAD_BALANCER=$(gcloud compute addresses describe vault   --region us-east4   --project corrigan-gcp   --format='value(address)')

# Create load-balancer service config
cat > vault-load-balancer.yaml <<EOF
apiVersion: v1
kind: Service
metadata:
  name: vault-load-balancer
spec:
  type: LoadBalancer
  loadBalancerIP: ${VAULT_LOAD_BALANCER_IP}
  ports:
    - name: http
      port: 8200
    - name: server
      port: 8201
  selector:
    app: vault
EOF

# Creat Load Balancer
kubectl apply -f vault-load-balancer.yaml

# Wait until External IP Address Shows up before proceeding
kubectl get svc vault-load-balancer
