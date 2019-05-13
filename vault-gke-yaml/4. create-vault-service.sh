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
    - name: http
      port: 8200
    - name: server
      port: 8201
  selector:
    app: vault
EOF

kubectl create -f vaultservice.yaml -n vault-deploy

kubectl get service
