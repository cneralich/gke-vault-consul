cat <<EOF > vaultservice.yaml
apiVersion: v1
kind: Service
metadata:
  name: vault
  labels:
    app: vault
spec:
  type: ClusterIP
  ports:
    - name: vault
      port: 8200
      targetPort: 8200
      protocol: "TCP"
  selector:
    app: vault
EOF

kubectl create -f vaultservice.yaml -n vault-deploy

kubectl get service
