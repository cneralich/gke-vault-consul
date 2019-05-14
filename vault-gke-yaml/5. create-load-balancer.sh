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
