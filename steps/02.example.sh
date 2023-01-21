echo "create secrets"

export GH_NAME="change_me"
export GH_EMAIL="change_me"
export GH_USERNAME="change_me"
export GH_PASSWORD="change_me"
export GH_WEBHOOK_SECRET="change_me"

export CF_API_KEY="change_me"
export CF_TUNNEL_CREDS_FILE="change_me"

export PG_PROD_POSTGRES="change_me"
export PG_PROD_MIGRATIONS="change_me"
export PG_PROD_EXPORTER="change_me"
export PG_PROD_PINGAPP="change_me"

kubectl create namespace argocd
kubectl create namespace pipeline
kubectl create namespace staging
kubectl create namespace production
kubectl create namespace cert-manager

kubectl create secret generic tunnel-credentials --from-file=credentials.json=$CF_TUNNEL_CREDS_FILE -n production

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: github-creds
  namespace: argocd
type: Opaque
stringData:
  name: ${GH_NAME}
  email: ${GH_EMAIL}
  username: ${GH_USERNAME}
  password: ${GH_PASSWORD}
  token: ${GH_PASSWORD}
  webhookSecret: ${GH_WEBHOOK_SECRET}
EOF

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: github-creds
  namespace: pipeline
type: Opaque
stringData:
  name: ${GH_NAME}
  email: ${GH_EMAIL}
  username: ${GH_USERNAME}
  password: ${GH_PASSWORD}
  token: ${GH_PASSWORD}
  webhookSecret: ${GH_WEBHOOK_SECRET}
EOF

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
 name: cloudflare-api-token-secret
 namespace: cert-manager
type: Opaque
stringData:
 api-token: ${CF_API_KEY}
EOF

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: maindb-postgresql
  namespace: production
stringData:
  postgres-password: ${PG_PROD_POSTGRES}
  migrations-password: ${PG_PROD_MIGRATIONS}
  exporter-password: ${PG_PROD_EXPORTER}
  pingapp-password: ${PG_PROD_PINGAPP}
EOF

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: maindb-postgresql
  namespace: pipeline
stringData:
  postgres-password: ${PG_PROD_POSTGRES}
  migrations-password: ${PG_PROD_MIGRATIONS}
  exporter-password: ${PG_PROD_EXPORTER}
  pingapp-password: ${PG_PROD_PINGAPP}
EOF
